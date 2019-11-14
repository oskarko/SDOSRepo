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
    @State private var showAlert = false
    
    init(viewModel: CurrentMovieRowViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        VStack(spacing: 50) {
            HStack {
                VStack {
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
                }
                VStack(alignment: .leading, spacing: 16) {
                    
                    VStack(alignment: .leading) {
                        Text("Genres:").font(.headline)
                        Text("\(viewModel.genre)").font(.subheadline).onTapGesture(count: 2) {
                            self.copyTextToClipboard(text: self.viewModel.genre)
                            self.showAlert = true
                        }
                    }.alert(isPresented: $showAlert) { () -> Alert in
                        showAlertView()
                    }
                    VStack(alignment: .leading) {
                        Text("Released at:").font(.headline)
                        Text("\(viewModel.released)").font(.subheadline).onTapGesture(count: 2) {
                            self.copyTextToClipboard(text: self.viewModel.released)
                            self.showAlert = true
                        }
                    }.alert(isPresented: $showAlert) { () -> Alert in
                        showAlertView()
                    }
                    VStack(alignment: .leading) {
                        Text("Duration:").font(.headline)
                        Text("\(viewModel.duration)").font(.subheadline).onTapGesture(count: 2) {
                            self.copyTextToClipboard(text: self.viewModel.duration)
                            self.showAlert = true
                        }
                    }.alert(isPresented: $showAlert) { () -> Alert in
                        showAlertView()
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            }
            VStack(alignment: .leading) {
                Text("Plot:").font(.headline)
                Text("\(viewModel.plot)").font(.subheadline).onTapGesture(count: 2) {
                    self.copyTextToClipboard(text: self.viewModel.plot)
                    self.showAlert = true
                }
            }.alert(isPresented: $showAlert) { () -> Alert in
                showAlertView()
            }
        }
    }
    
    
    private func copyTextToClipboard(text: String) {
        let pasteboard = UIPasteboard.general
        pasteboard.string = text
    }
    
    private func showAlertView() -> Alert {
        return Alert(title: Text("SDOS"), message: Text("Text copied to clipboard"), dismissButton: .default(Text("Got it!")))
    }
}
