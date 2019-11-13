//
//  MovieRow.swift
//  OMDbApp
//
//  Created by Oscar Rodriguez Garrucho on 12/11/2019.
//  Copyright © 2019 Oscar Rodriguez Garrucho. All rights reserved.
//

import SwiftUI
import URLImage

struct MovieRow: View {
  private let viewModel: MovieRowViewModel
  
  init(viewModel: MovieRowViewModel) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    HStack {
        URLImage(URL(string:"\(viewModel.poster)")!,
        delay: 0.25,
        processors: [ Resize(size: CGSize(width: 50.0, height: 100.0), scale: UIScreen.main.scale) ],
        content:  {
            $0.image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipped()
        })
            .frame(width: 50.0, height: 100.0)
        
        
      VStack {
        Text("\(viewModel.title)").font(.headline)
        Text("\(viewModel.year)").font(.subheadline)
      }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
    }
    
  }
}
