//
//  NetworkError.swift
//  01-API-Networking
//
//  Created by D F on 6/12/26.
//

import Foundation

enum NetworkError: Error {
    case invalidResponse
    case serverError(statusCode: Int)
}
