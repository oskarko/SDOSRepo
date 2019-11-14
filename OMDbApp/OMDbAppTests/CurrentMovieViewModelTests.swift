//
//  CurrentMovieViewModelTests.swift
//  OMDbAppTests
//
//  Created by Oscar Rodriguez Garrucho on 14/11/2019.
//  Copyright © 2019 Oscar Rodriguez Garrucho. All rights reserved.
//

import XCTest

class CurrentMovieViewModelTests: XCTestCase {

    var viewModel : CurrentMovieViewModel!
    
    override func setUp() {
        super.setUp()
        let item = SearchMovieResponse(title: "Mi first test title", year: "2000", imdbID: "imdb1", type: "movie", poster: "https://sdos.es/home", released: "at any date", genre: "Sci-Fi", duration: "180 min.", plot: "a long long history", web: "https://sdos.es/home")
        let dataSource = CurrentMovieRowViewModel(item: item)
        viewModel = CurrentMovieViewModel(imdbID: "imdb1", title: "Mi first test title")
        viewModel.dataSource = dataSource
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testValueInDataSource() {

        // expected id in dataSource
        XCTAssertEqual(viewModel.dataSource?.id, "imdb1", "Expected imdb1 in datasource")

        // expected same title
        XCTAssertEqual(viewModel.dataSource?.title, "Mi first test title", "Expected as 'Mi first test title' item title")
        
        // expected same year
        XCTAssertEqual(viewModel.dataSource?.year, "2000", "Expected 2000 as year")
        
        // expected same poster
        XCTAssertEqual(viewModel.dataSource?.poster, "https://sdos.es/home", "Expected same poster as dataSource")
        
        // expected same release date
        XCTAssertEqual(viewModel.dataSource?.released, "at any date", "Expected same release date as dataSource")
        
        // expected same genre
        XCTAssertEqual(viewModel.dataSource?.genre, "Sci-Fi", "Expected same value for genre")
        
        // expected same duration
        XCTAssertEqual(viewModel.dataSource?.duration, "180 min.", "Expected same duration for dataSource")
        
        // expected same plot
        XCTAssertEqual(viewModel.dataSource?.plot, "a long long history", "Expected plot for dataSource")
        
        // expected same web
        XCTAssertEqual(viewModel.dataSource?.website, "https://sdos.es/home", "Expected same website value")
    }
    
}
