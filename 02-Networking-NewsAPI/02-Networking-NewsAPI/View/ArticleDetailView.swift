//
//  ArticleDetailView.swift
//  02-Networking-NewsAPI
//
//  Created by D F on 6/19/26.
//

import SwiftUI
import SwiftUI

struct ArticleDetailView: View {
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

                    Divider()

                    if let description = article.description {
                        Text(description)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
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
    }
    
}
