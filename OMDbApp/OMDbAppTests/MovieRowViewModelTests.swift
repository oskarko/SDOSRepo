//
//  MovieRowViewModelTests.swift
//  OMDbAppTests
//
//  Created by Oscar Rodriguez Garrucho on 14/11/2019.
//  Copyright © 2019 Oscar Rodriguez Garrucho. All rights reserved.
//

import XCTest

class MovieRowViewModelTests: XCTestCase {

    var viewModel : MovieRowViewModel!
    
    override func setUp() {
        super.setUp()
        let item = SearchMoviesResponse.Item(title: "Mi first test title", year: "2000", imdbID: "imdb1", type: "movie", poster: "https://sdos.es/home")
        viewModel = MovieRowViewModel(item: item)
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testViewModel() {
        
        // expected correct ID
        XCTAssertEqual(viewModel.id, "imdb1", "Expected same imdbID in viewModel")
        
        // expected correct title
        XCTAssertEqual(viewModel.title, "Mi first test title", "Expected same title in viewModel")
        
        // expected correct year
        XCTAssertEqual(viewModel.year, "2000", "Expected same year in viewModel")
        
        // expected same poster string
        XCTAssertEqual(viewModel.poster, "https://sdos.es/home", "Expected same poster in viewModel")
    }

}
