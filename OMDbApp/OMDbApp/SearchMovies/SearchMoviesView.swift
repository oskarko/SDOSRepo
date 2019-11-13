//
//  SearchMovieView.swift
//  OMDbApp
//
//  Created by Oscar Rodriguez Garrucho on 12/11/2019.
//  Copyright © 2019 Oscar Rodriguez Garrucho. All rights reserved.
//

import SwiftUI

struct SearchMoviesView: View {
  @ObservedObject var viewModel: SearchMoviesViewModel

  init(viewModel: SearchMoviesViewModel) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    NavigationView {
      List {
        searchField

        if viewModel.dataSource.isEmpty {
            emptySection
        } else {
            fetchSection
        }
      }
        .listStyle(GroupedListStyle())
        .navigationBarTitle("Movies ⛅️")
    }
  }
}

private extension SearchMoviesView {
  var searchField: some View {
    HStack(alignment: .center) {
      TextField("e.g. Matrix", text: $viewModel.title)
    }
  }

  var fetchSection: some View {
    Section {
        
        NavigationLink(destination: viewModel.moviesView) {
          VStack(alignment: .leading) {
            ForEach(viewModel.dataSource, content: MovieRow.init(viewModel:))
          }
        }
    }
  }

  var emptySection: some View {
    Section {
      Text("No results")
        .foregroundColor(.gray)
    }
  }
}
