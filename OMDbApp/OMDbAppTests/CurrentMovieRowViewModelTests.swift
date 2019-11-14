//
//  CurrentMovieRowViewModelTests.swift
//  OMDbAppTests
//
//  Created by Oscar Rodriguez Garrucho on 14/11/2019.
//  Copyright © 2019 Oscar Rodriguez Garrucho. All rights reserved.
//

import XCTest

class CurrentMovieRowViewModelTests: XCTestCase {

    var viewModel : CurrentMovieRowViewModel!
    
    override func setUp() {
        super.setUp()
        let item = SearchMovieResponse(title: "Mi first test title", year: "2000", imdbID: "imdb1", type: "movie", poster: "https://sdos.es/home", released: "at any date", genre: "Sci-Fi", duration: "180 min.", plot: "a long long history", web: "https://sdos.es/home")
        viewModel = CurrentMovieRowViewModel(item: item)
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testViewModel() {
        
        // expected id in dataSource
        XCTAssertEqual(viewModel.id, "imdb1", "Expected imdb1 in datasource")

        // expected same title
        XCTAssertEqual(viewModel.title, "Mi first test title", "Expected as 'Mi first test title' item title")
        
        // expected same year
        XCTAssertEqual(viewModel.year, "2000", "Expected 2000 as year")
        
        // expected same poster
        XCTAssertEqual(viewModel.poster, "https://sdos.es/home", "Expected same poster as dataSource")
        
        // expected same release date
        XCTAssertEqual(viewModel.released, "at any date", "Expected same release date as dataSource")
        
        // expected same genre
        XCTAssertEqual(viewModel.genre, "Sci-Fi", "Expected same value for genre")
        
        // expected same duration
        XCTAssertEqual(viewModel.duration, "180 min.", "Expected same duration for dataSource")
        
        // expected same plot
        XCTAssertEqual(viewModel.plot, "a long long history", "Expected plot for dataSource")
        
        // expected same web
        XCTAssertEqual(viewModel.website, "https://sdos.es/home", "Expected same website value")
    }

}
