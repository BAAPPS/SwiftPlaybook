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
        @Bindable var nfVM = nfVM
        VStack {
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
            .safeAreaInset(edge: .bottom) {
                NewsTabBarView(
                    selectedTab: $nfVM.selectedTab
                )
                .padding(.horizontal)
                .padding(.vertical, 18)
                .background(Color.white)
            }
            .task {
                print("TASK FIRED")
                await nfVM.fetch()
            }
            .onChange(of: nfVM.selectedTab) {
                Task {
                    await nfVM.fetch()
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(NewsFeedViewModel())
}
