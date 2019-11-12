//
//  MovieRowViewModel.swift
//  OMDbApp
//
//  Created by Oscar Rodriguez Garrucho on 12/11/2019.
//  Copyright © 2019 Oscar Rodriguez Garrucho. All rights reserved.
//


import Foundation
import SwiftUI

struct MovieRowViewModel: Identifiable {
    
    private let item: SearchMoviesResponse.Item
    
    var id: String {
        return item.imdbID
    }
    
    var title: String {
        return item.title
    }
    
    var year: String {
        return item.year
    }
    
    var poster: String {
        return item.poster
    }
    
    init(item: SearchMoviesResponse.Item) {
        self.item = item
    }
}


// Used to hash on just the title in order to produce a single view model for each
// title when there are multiple items per each title.
extension MovieRowViewModel: Hashable {
    static func == (lhs: MovieRowViewModel, rhs: MovieRowViewModel) -> Bool {
        return lhs.title == rhs.title
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.title)
    }
}
