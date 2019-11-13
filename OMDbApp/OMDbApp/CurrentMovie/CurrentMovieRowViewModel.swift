//
//  CurrentMovieRowViewModel.swift
//  OMDbApp
//
//  Created by Oscar Rodriguez Garrucho on 12/11/2019.
//  Copyright © 2019 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation
import SwiftUI

struct CurrentMovieRowViewModel {
    
    private let item: SearchMovieResponse
    
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
    
    var released: String {
        return item.released
    }
    
    var genre: String {
        return item.genre
    }
    
    var duration: String {
        return item.duration
    }
    
    var plot: String {
        return item.plot
    }
    
    var website: String {
        return item.web
    }
    
    init(item: SearchMovieResponse) {
        self.item = item
    }
}
