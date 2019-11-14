//
//  SearchMovieViewModel.swift
//  OMDbApp
//
//  Created by Oscar Rodriguez Garrucho on 12/11/2019.
//  Copyright © 2019 Oscar Rodriguez Garrucho. All rights reserved.
//

import SwiftUI
import Combine

class SearchMoviesViewModel: ObservableObject {
    
    @Published var title: String = ""
    @Published var dataSource: [MovieRowViewModel] = []
    
    private let moviesFetcher: MovieFetchable
    private var disposables = Set<AnyCancellable>()
    
    init(moviesFetcher: MovieFetchable, scheduler: DispatchQueue = DispatchQueue(label: "MoviesViewModel")) {
        self.moviesFetcher = moviesFetcher
        _ = $title
            .dropFirst(1)
            .debounce(for: .seconds(0.5), scheduler: scheduler)
            .sink(receiveValue: fetchMovies(forTitle:))
    }
    
    func fetchMovies(forTitle title: String) {
        moviesFetcher.searchMovies(forTitle: title)
            .map { response in
                response.Search.map(MovieRowViewModel.init)
        }
        .receive(on: DispatchQueue.main)
        .sink(
            receiveCompletion: { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure:
                    self.dataSource = []
                case .finished:
                    break
                }
            },
            receiveValue: { [weak self] movie in
                guard let self = self else { return }
                self.dataSource = movie
        })
            .store(in: &disposables)
    }
    
    func details(movie: MovieRowViewModel) -> some View {
        let viewModel = CurrentMovieViewModel(imdbID: movie.id, title: movie.title)
        return CurrentMovieView(viewModel: viewModel)
    }
}
