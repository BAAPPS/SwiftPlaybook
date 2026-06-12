//
//  APIEndpoint.swift
//  01-API-Networking
//
//  Created by D F on 6/12/26.
//

import Foundation

enum APIEndpoint {
    case login
    case users(page: Int)
    
    // MARK: - BASE URL
    
    private var baseURL: String {
        "https://reqres.in/api"
    }
    
    // MARK: - PATH
    private var path: String {
        switch self {
            case .login:
                return "/login"
        case .users:
                return "/users"
        }
    }
    
    // MARK: - FULL URL
    
    var url: URL {
        switch self {
        case .users(let page):
            return URL(string: "\(baseURL)\(path)?page=\(page)")!
        default:
            return URL(string: "\(baseURL)\(path)")!
        }
    }
    
    // MARK: - HTTP Method
    
    var method: String {
        switch self {
        case .login:
            return "POST"
        case .users:
            return "GET"
        }
    }
    
}
