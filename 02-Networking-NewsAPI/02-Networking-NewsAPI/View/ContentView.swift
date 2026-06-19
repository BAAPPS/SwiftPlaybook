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
                    ScrollView {
                        LazyVStack(alignment: .leading) {
                            ForEach(nfVM.articles, id: \.url) { article in
                                VStack(alignment:.leading, spacing:6) {
                                    VStack(spacing:10) {
                                        Text(article.title)
                                            .font(.system(size: 20, weight:.bold))
                                            .foregroundStyle(Color.black.opacity(0.7))
                                            .multilineTextAlignment(.center)
                                        
                                        Rectangle()
                                            .fill(Color.gray.opacity(0.5))
                                            .frame(width: 60, height: 1)
                                            .frame(maxWidth: .infinity)

                                        Text(article.source.name)
                                            .font(.system(size:15, weight:.regular))
                                            .foregroundStyle(.black.opacity(0.5))
                                    }
                                    .frame(maxWidth: .infinity, alignment: .center)

                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(10)
                                .background(Color.white.opacity(0.7))
                                .shadow(
                                    color: .black.opacity(0.12),
                                    radius: 12,
                                    x: 0,
                                    y: 4
                                )
                            }
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
