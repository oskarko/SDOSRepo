//
//  SearchMoviesViewModelTests.swift
//  OMDbAppTests
//
//  Created by Oscar Rodriguez Garrucho on 14/11/2019.
//  Copyright © 2019 Oscar Rodriguez Garrucho. All rights reserved.
//

import XCTest

class SearchMoviesViewModelTests: XCTestCase {

    var viewModel : SearchMoviesViewModel!
    
    override func setUp() {
        super.setUp()
        // giving data value
        let movieRowOne = MovieRowViewModel(item: SearchMoviesResponse.Item(title: "Mi first test title", year: "2000", imdbID: "imdb1", type: "movie", poster: "https://sdos.es/home"))
        let movieRowTwo = MovieRowViewModel(item: SearchMoviesResponse.Item(title: "Mi second test title", year: "2004", imdbID: "imdb2", type: "movie", poster: "https://sdos.es/home"))
        let fetcher = MovieFetcher()
        viewModel = SearchMoviesViewModel(moviesFetcher: fetcher)
        viewModel.dataSource = [movieRowOne, movieRowTwo]
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testValueInDataSource() {

        // expected two items in dataSource
        XCTAssertEqual(viewModel.dataSource.count, 2, "Expected two items in datasource")

        // expected same title
        XCTAssertEqual(viewModel.dataSource[0].title, "Mi first test title", "Expected as 'Mi first test title' item title")
    }

}
