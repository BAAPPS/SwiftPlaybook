//
//  PaginatedResponse.swift
//  03-Networking-TMDB
//
//  Created by D F on 6/23/26.
//

import Foundation


struct PaginatedResponse<T:Decodable>: Decodable {
    let page: Int
    let results: [T]
}
