//
//  Responses.swift
//  OMDbApp
//
//  Created by Oscar Rodriguez Garrucho on 12/11/2019.
//  Copyright © 2019 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation

struct SearchMoviesResponse: Codable {
    let list: [Item]
    
    struct Item: Codable {
        let title: String
        let year: String
        let imdbID: String
        let type: String
        let poster: String
        //    let main: MainClass
        //    let weather: [Weather]
        
        enum CodingKeys: String, CodingKey {
            case title = "Title"
            case year = "Year"
            case imdbID = "imdbID"
            case type = "Type"
            case poster = "Poster"
        }
    }
    //
    //    struct MainClass: Codable {
    //    let temp: Double
    //  }
    //
    //  struct Weather: Codable {
    //    let main: MainEnum
    //    let weatherDescription: String
    //
    //    enum CodingKeys: String, CodingKey {
    //      case main
    //      case weatherDescription = "description"
    //    }
    //  }
    
    //  enum MainEnum: String, Codable {
    //    case clear = "Clear"
    //    case clouds = "Clouds"
    //    case rain = "Rain"
    //  }
}

struct SearchMovieResponse: Decodable {
    
    let title: String
    let year: String
    let imdbID: String
    let type: String
    let poster: String
    
    //    struct Item: Codable {
    //        let title: String
    //        let year: String
    //        let imdbID: String
    //        let type: String
    //        let poster: String
    //        //    let main: MainClass
    //        //    let weather: [Weather]
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
}
