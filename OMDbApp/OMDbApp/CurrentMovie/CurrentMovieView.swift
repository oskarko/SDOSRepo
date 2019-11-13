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
    @State var isPresented = false

  init(viewModel: CurrentMovieViewModel) {
    self.viewModel = viewModel
  }

//  var body: some View {
//    List(content: content)
//      .onAppear(perform: viewModel.refresh)
//      .navigationBarTitle(viewModel.title)
//      .listStyle(GroupedListStyle())
//  }
    var body: some View {
      NavigationView {
        List {
            if viewModel.dataSource != nil {
                details(for: viewModel.dataSource!)
                webBtn
            } else {
                loading
            }
        }
          .listStyle(GroupedListStyle())
          .navigationBarTitle(viewModel.title)
      }
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
    
    var webBtn: some View {
        VStack {
        Text("Website:").font(.headline)
        Button(action: {
            if self.viewModel.dataSource != nil &&
                (self.viewModel.dataSource?.website.count)! > 8 {
                self.isPresented = true
            }
        }){
            HStack
            {
                Spacer()
                Text("\(viewModel.dataSource!.website)")//.lineLimit(nil)
//                .multilineTextAlignment(.center)
//                .padding(.horizontal, 40)
                Spacer()
            }
      }.background(Color.green)
        .sheet(isPresented:$isPresented, onDismiss: {
            print("Dismiss")
        }, content: {
            if self.viewModel.dataSource != nil &&
                (self.viewModel.dataSource?.website.count)! > 8 {
                ActivityViewController(activityItems: [URL(string: self.viewModel.dataSource!.website)!])
            }
            
        })
        }
    }
}

