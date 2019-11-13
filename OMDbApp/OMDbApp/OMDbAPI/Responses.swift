//
//  Responses.swift
//  OMDbApp
//
//  Created by Oscar Rodriguez Garrucho on 12/11/2019.
//  Copyright © 2019 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation

struct SearchMoviesResponse: Codable {
    let Search: [Item]
    
    struct Item: Codable {
        let title: String
        let year: String
        let imdbID: String
        let type: String
        let poster: String
        //    let main: MainClass
        //    let weather: [Weather]
        
        enum CodingKeys: String, CodingKey {
            case title = "Title"
            case year = "Year"
            case imdbID = "imdbID"
            case type = "Type"
            case poster = "Poster"
        }
    }
}

struct SearchMovieResponse: Decodable {
    
    let title: String
    let year: String
    let imdbID: String
    let type: String
    let poster: String
    let released: String
    let genre: String
    let duration: String
    let plot: String
    let web: String
    
    //    struct Item: Codable {
    //        let title: String
    //        let year: String
    //        let imdbID: String
    //        let type: String
    //        let poster: String
    //        //    let main: MainClass
    //        //    let weather: [Weather]
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID = "imdbID"
        case type = "Type"
        case poster = "Poster"
        case released = "Released"
        case genre = "Genre"
        case duration = "Runtime"
        case plot = "Plot"
        case web = "Website"
    }
}
