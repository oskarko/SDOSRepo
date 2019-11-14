//
//  SearchMovieResponseTests.swift
//  OMDbAppTests
//
//  Created by Oscar Rodriguez Garrucho on 14/11/2019.
//  Copyright © 2019 Oscar Rodriguez Garrucho. All rights reserved.
//

import XCTest

class SearchMovieResponseTests: XCTestCase {

    var model: SearchMovieResponse!
    
    override func setUp() {
        super.setUp()
        model = SearchMovieResponse(title: "Mi first test title", year: "2000", imdbID: "imdb1", type: "movie", poster: "https://sdos.es/home", released: "at any date", genre: "Sci-Fi", duration: "180 min.", plot: "a long long history", web: "https://sdos.es/home")
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
        
        // expected release date in model
        XCTAssertEqual(model.released, "at any date", "Expected same release date as model")
        
        // expected genre in model
        XCTAssertEqual(model.genre, "Sci-Fi", "Expected same value for genre")
        
        // expected duration in model
        XCTAssertEqual(model.duration, "180 min.", "Expected same duration for model")
        
        // expected plot in model
        XCTAssertEqual(model.plot, "a long long history", "Expected plot for model")
        
        // expected website in model
        XCTAssertEqual(model.web, "https://sdos.es/home", "Expected same website value")
    }
}
