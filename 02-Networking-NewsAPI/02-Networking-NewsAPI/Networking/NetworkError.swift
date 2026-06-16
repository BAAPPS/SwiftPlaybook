//
//  NetworkError.swift
//  02-Networking-NewsAPI
//
//  Created by D F on 6/15/26.
//

import Foundation


enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case serverError(statusCode: Int)
}
