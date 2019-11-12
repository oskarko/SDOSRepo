//
//  MovieError.swift
//  OMDbApp
//
//  Created by Oscar Rodriguez Garrucho on 12/11/2019.
//  Copyright © 2019 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation

enum MovieError: Error {
  case parsing(description: String)
  case network(description: String)
}
