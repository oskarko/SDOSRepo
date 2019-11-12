//
//  CurrentMovieView.swift
//  OMDbApp
//
//  Created by Oscar Rodriguez Garrucho on 12/11/2019.
//  Copyright © 2019 Oscar Rodriguez Garrucho. All rights reserved.
//

import SwiftUI

struct CurrentMovieView: View {
  
    @ObservedObject var viewModel: CurrentMovieViewModel

  init(viewModel: CurrentMovieViewModel) {
    self.viewModel = viewModel
  }

  var body: some View {
    List(content: content)
      .onAppear(perform: viewModel.refresh)
      .navigationBarTitle(viewModel.title)
      .listStyle(GroupedListStyle())
  }
}

private extension CurrentMovieView {
  func content() -> some View {
    if let viewModel = viewModel.dataSource {
      return AnyView(details(for: viewModel))
    } else {
      return AnyView(loading)
    }
  }

  func details(for viewModel: CurrentMovieRowViewModel) -> some View {
    CurrentMovieRow(viewModel: viewModel)
  }

  var loading: some View {
    Text("Loading \(viewModel.title)'s info...")
      .foregroundColor(.gray)
  }
}

