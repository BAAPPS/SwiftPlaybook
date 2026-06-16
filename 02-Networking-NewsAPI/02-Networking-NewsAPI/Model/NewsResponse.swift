//
//  News.swift
//  02-Networking-NewsAPI
//
//  Created by D F on 6/15/26.
//

import Foundation


struct NewsResponse: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}
