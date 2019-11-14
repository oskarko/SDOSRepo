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
     @State var showSplash = true

  init(viewModel: SearchMoviesViewModel) {
    self.viewModel = viewModel
  }
  
    var body: some View {
        ZStack{
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
                .navigationBarTitle("Movies 🎬")
            }
            SplashScreen()
                .opacity(showSplash ? 1 : 0)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                        SplashScreen.shouldAnimate = false
                        withAnimation() {
                            self.showSplash = false
                        }
                    }
            }
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
            ForEach(viewModel.dataSource) { movie in
                NavigationLink(destination: self.viewModel.details(movie: movie)) {
                    MovieRow.init(viewModel:movie)
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
