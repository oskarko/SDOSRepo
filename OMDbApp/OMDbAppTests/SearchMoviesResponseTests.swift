//
//  SearchMoviesResponseTests.swift
//  OMDbAppTests
//
//  Created by Oscar Rodriguez Garrucho on 14/11/2019.
//  Copyright © 2019 Oscar Rodriguez Garrucho. All rights reserved.
//

import XCTest

class SearchMoviesResponseTests: XCTestCase {

    var model: SearchMoviesResponse.Item!
    
    override func setUp() {
        super.setUp()
        model = SearchMoviesResponse.Item(title: "Mi first test title", year: "2000", imdbID: "imdb1", type: "movie", poster: "https://sdos.es/home")
    }

    override func tearDown() {
        model = nil
        super.tearDown()
    }

    func testModel() {
        
        // expected id in model
        XCTAssertEqual(model.imdbID, "imdb1", "Expected imdb1 in model")
        
        // expected title in model
        XCTAssertEqual(model.title, "Mi first test title", "Expected title in model")
        
        // expected year in model
        XCTAssertEqual(model.year, "2000", "Expected year in model")
        
        // expected poster in model
        XCTAssertEqual(model.poster, "https://sdos.es/home", "Expected poster in model")
    }

}
