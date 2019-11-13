//
//  CurrentMovieRow.swift
//  OMDbApp
//
//  Created by Oscar Rodriguez Garrucho on 12/11/2019.
//  Copyright © 2019 Oscar Rodriguez Garrucho. All rights reserved.
//

import SwiftUI
import URLImage

struct CurrentMovieRow: View {
    private let viewModel: CurrentMovieRowViewModel
    
    init(viewModel: CurrentMovieRowViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        VStack(spacing: 50) {
            HStack {
                URLImage(URL(string:"\(viewModel.poster)")!,
                         delay: 0.25,
                         processors: [ Resize(size: CGSize(width: 150.0, height: 300.0), scale: UIScreen.main.scale) ],
                         content:  {
                            $0.image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipped()
                })
                .frame(width: 160.0, height: 320.0)
                
                VStack(alignment: .leading, spacing: 16) {
                    
                    VStack {
                        Text("Gen.:").font(.headline)
                        Text("\(viewModel.genre)").font(.subheadline)
                    }
                    VStack {
                        Text("Released at:").font(.headline)
                        Text("\(viewModel.released)").font(.subheadline)
                    }
                    VStack {
                        Text("Duration:").font(.headline)
                        Text("\(viewModel.duration)").font(.subheadline)
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            }
            
            VStack(alignment: .leading) {
                Text("Plot:").font(.headline)
                Text("\(viewModel.plot)").font(.subheadline)
            }
            
//            VStack(alignment: .leading) {
//                Text("Website:").font(.headline)
//                Text("\(viewModel.website)").font(.subheadline)
//
////                Button(action: {}) {
////                    HStack {
////                        Text("Sign In")
////                        Spacer()
////                    }
////                }.background(Color.green)
//            }
            
        }
        
        
        //        VStack(alignment: .leading) {
        //            HStack {
        //                Text("☀️ Title:")
        //                Text("\(viewModel.title)°")
        //                    .foregroundColor(.gray)
        //            }
        //
        //            HStack {
        //                Text("📈 Year:")
        //                Text("\(viewModel.year)°")
        //                    .foregroundColor(.gray)
        //            }
        //
        //            HStack {
        //                Text("📉 id:")
        //                Text("\(viewModel.id)°")
        //                    .foregroundColor(.gray)
        //            }
        //
        //            HStack {
        //                Text("💧 Poster:")
        //                Text(viewModel.poster)
        //                    .foregroundColor(.gray)
        //            }
        //
        //            HStack {
        //                Text("💧 Released at:")
        //                Text(viewModel.released)
        //                    .foregroundColor(.gray)
        //            }
        //
        //            HStack {
        //                Text("💧 Gen.:")
        //                Text(viewModel.genre)
        //                    .foregroundColor(.gray)
        //            }
        //
        //            HStack {
        //                Text("💧 Duration:")
        //                Text(viewModel.duration)
        //                    .foregroundColor(.gray)
        //            }
        //
        //            HStack {
        //                Text("💧 Plot:")
        //                Text(viewModel.plot)
        //                    .foregroundColor(.gray)
        //            }
        //
        //            HStack {
        //                Text("💧 Website:")
        //                Text(viewModel.website)
        //                    .foregroundColor(.gray)
        //            }
        //        }
    }
}


