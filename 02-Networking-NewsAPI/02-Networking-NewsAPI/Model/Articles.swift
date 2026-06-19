//
//  Articles.swift
//  02-Networking-NewsAPI
//
//  Created by D F on 6/15/26.
//

import Foundation

struct Article: Decodable {
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}



extension Article {
    static let mock = Article(
        source: Source(
            id: nil,
            name: "TechCrunch"
        ),
        author: "John Doe",
        title: "SwiftUI NavigationLinks Just Got Easier",
        description: "Apple improves navigation patterns in SwiftUI apps.",
        url: "https://example.com",
        urlToImage: "https://hackaday.com/wp-content/uploads/2026/05/rip_so_digital_graveyard.jpg",
        publishedAt: "2026-06-19",
        content: "Full article content shown here for preview purposes."
    )
}
