//
//  MovieRow.swift
//  OMDbApp
//
//  Created by Oscar Rodriguez Garrucho on 12/11/2019.
//  Copyright © 2019 Oscar Rodriguez Garrucho. All rights reserved.
//

import SwiftUI

struct MovieRow: View {
  private let viewModel: MovieRowViewModel
  
  init(viewModel: MovieRowViewModel) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    HStack {
      VStack {
        Text("\(viewModel.title)")
        Text("\(viewModel.year)")
      }
      
      VStack(alignment: .leading) {
        Text("\(viewModel.title)")
          .font(.body)
        Text("\(viewModel.year)")
          .font(.footnote)
      }
        .padding(.leading, 8)

      Spacer()

      Text("\(viewModel.year)°")
        .font(.title)
    }
  }
}
