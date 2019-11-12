//
//  CurrentMovieViewModel.swift
//  OMDbApp
//
//  Created by Oscar Rodriguez Garrucho on 12/11/2019.
//  Copyright © 2019 Oscar Rodriguez Garrucho. All rights reserved.
//

import SwiftUI
import Combine

class CurrentMovieViewModel: ObservableObject {
    
    @Published var dataSource: CurrentMovieRowViewModel?
    
    let title: String
    private let movieFetcher: MovieFetchable
    private var disposables = Set<AnyCancellable>()
    
    init(title: String, movieFetcher: MovieFetchable) {
        self.movieFetcher = movieFetcher
        self.title = title
    }
    
    func refresh() {
        movieFetcher
            .searchMovie(forID: title)
            .map(CurrentMovieRowViewModel.init)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure:
                    self.dataSource = nil
                case .finished:
                    break
                }
                }, receiveValue: { [weak self] weather in
                    guard let self = self else { return }
                    self.dataSource = weather
            })
            .store(in: &disposables)
    }
}

