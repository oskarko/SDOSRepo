//
//  CurrentMovieRow.swift
//  OMDbApp
//
//  Created by Oscar Rodriguez Garrucho on 12/11/2019.
//  Copyright © 2019 Oscar Rodriguez Garrucho. All rights reserved.
//

import SwiftUI

struct CurrentMovieRow: View {
    private let viewModel: CurrentMovieRowViewModel
    
    init(viewModel: CurrentMovieRowViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Text("☀️ Title:")
                Text("\(viewModel.title)°")
                    .foregroundColor(.gray)
            }
            
            HStack {
                Text("📈 Year:")
                Text("\(viewModel.year)°")
                    .foregroundColor(.gray)
            }
            
            HStack {
                Text("📉 id:")
                Text("\(viewModel.id)°")
                    .foregroundColor(.gray)
            }
            
            HStack {
                Text("💧 Poster:")
                Text(viewModel.poster)
                    .foregroundColor(.gray)
            }
        }
    }
}


