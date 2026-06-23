//
//  ArticleDetailView.swift
//  02-Networking-NewsAPI
//
//  Created by D F on 6/19/26.
//

import SwiftUI
import SwiftUI

struct ArticleDetailView: View {
    @Environment(NewsFeedViewModel.self) var nfVM
    let article: Article
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                AsyncImage(url: URL(string: article.urlToImage ?? "")) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                    default:
                        Color.gray
                    }
                }
                .clipped()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(article.title)
                        .font(.title)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                    if let description = article.description {
                        Text(description)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    Divider()
                    
                    
                    
                    HStack(alignment: .firstTextBaseline, spacing:10) {
                        Text(nfVM.formatStringDate(article.publishedAt))
                            .iconRow("calendar.badge.plus")
                        
                        if let author = article.author {
                            VerticalDivider()
                            
                            Text(author)
                                .iconRow("person")
                            
                        }
                    }
                    .font(.system(size: 20, weight: .bold))
                    .padding(.top, 10)
                    
                    
                }
                .padding(.horizontal,10)
            }
        }
        .navigationTitle(article.source.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.hidden, for: .navigationBar)
    }
}
#Preview {
    NavigationStack {
        ArticleDetailView(article: .mock)
            .environment(NewsFeedViewModel())
    }
    
}
