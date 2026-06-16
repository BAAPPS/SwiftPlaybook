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
