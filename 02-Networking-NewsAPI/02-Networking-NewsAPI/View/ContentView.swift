//
//  ContentView.swift
//  02-Networking-NewsAPI
//
//  Created by D F on 6/12/26.
//

import SwiftUI

struct ContentView: View {
    @Environment(NewsFeedViewModel.self) var nfVM
    var body: some View {
        Group {
            if nfVM.isLoading {
                ProgressView()
            } else {
                List(nfVM.articles, id: \.url) { article in
                    VStack(alignment: .leading) {
                        Text(article.title)
                            .font(.headline)
                        
                        Text(article.source.name)
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                }
            }
        }
        .task {
            print("TASK FIRED")
            await nfVM.fetch()
        }
    }
}

#Preview {
    ContentView()
        .environment(NewsFeedViewModel())
}
