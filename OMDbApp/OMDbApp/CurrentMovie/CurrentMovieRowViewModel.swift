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
    
    init(item: SearchMovieResponse) {
        self.item = item
    }
}
