//
//  MovieFetcher.swift
//  OMDbApp
//
//  Created by Oscar Rodriguez Garrucho on 12/11/2019.
//  Copyright © 2019 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation
import Combine

protocol MovieFetchable {
  func searchMovies(forTitle title: String) -> AnyPublisher<SearchMoviesResponse, MovieError>
  func searchMovie(forID movieID: String) -> AnyPublisher<SearchMovieResponse, MovieError>
}

class MovieFetcher {
  private let session: URLSession
  
  init(session: URLSession = .shared) {
    self.session = session
  }
}

// MARK: - MovieFetchable
extension MovieFetcher: MovieFetchable {
  func searchMovies(forTitle title: String) -> AnyPublisher<SearchMoviesResponse, MovieError> {
    return fetch(with: makeSearchForMoviesComponents(withTitle: title))
  }

  func searchMovie(forID movieID: String) -> AnyPublisher<SearchMovieResponse, MovieError> {
    return fetch(with: makeSearchMovieComponents(withID: movieID))
  }

  private func fetch<T>(with components: URLComponents) -> AnyPublisher<T, MovieError> where T: Decodable {
    guard let url = components.url else {
      let error = MovieError.network(description: "Couldn't create URL")
      return Fail(error: error).eraseToAnyPublisher()
    }
    return session.dataTaskPublisher(for: URLRequest(url: url))
      .mapError { error in
        .network(description: error.localizedDescription)
      }
      .flatMap(maxPublishers: .max(1)) { pair in
        decode(pair.data)
      }
      .eraseToAnyPublisher()
  }
}

// MARK: - OpenWeatherMap API
private extension MovieFetcher {
  struct OpenWeatherAPI {
    static let scheme = "http"
    static let host = "www.omdbapi.com"
    static let path = ""
    static let key = "2810fbca"
  }
  
  func makeSearchForMoviesComponents(withTitle title: String) -> URLComponents {
    var components = URLComponents()
    components.scheme = OpenWeatherAPI.scheme
    components.host = OpenWeatherAPI.host
    components.path = OpenWeatherAPI.path
    
    components.queryItems = [
      URLQueryItem(name: "s", value: title),
      URLQueryItem(name: "type", value: "movie"),
      URLQueryItem(name: "apikey", value: OpenWeatherAPI.key)
    ]
    
    return components
  }
  
  func makeSearchMovieComponents(withID movieID: String) -> URLComponents {
    var components = URLComponents()
    components.scheme = OpenWeatherAPI.scheme
    components.host = OpenWeatherAPI.host
    components.path = OpenWeatherAPI.path
    
    components.queryItems = [
      URLQueryItem(name: "t", value: movieID),
      URLQueryItem(name: "type", value: "movie"),
      URLQueryItem(name: "apikey", value: OpenWeatherAPI.key)
    ]
    
    return components
  }
}
