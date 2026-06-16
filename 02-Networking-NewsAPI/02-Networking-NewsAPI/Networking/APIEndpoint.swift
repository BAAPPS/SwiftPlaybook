//
//  APIEndpoint.swift
//  02-Networking-NewsAPI
//
//  Created by D F on 6/15/26.
//

import Foundation

enum APIEndpoint {
    case everything(query:String?, domains: String?)
    case topHeadlines(country: String?, category: String?,  sources: String?)
    case topHeadlinesSources(category:String?, language: String?, country: String?)
    
    
    // MARK: - PATH
    private var path: String {
        switch self{
        case .everything:
            return "/everything"
        case .topHeadlines:
            return "/top-headlines"
        case .topHeadlinesSources:
            return "/top-headlines/sources"
        }
    }
    
    // MARK: FULL URL
    
    var url:URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "newsapi.org"
        components.path = "/v2" + path
        
        var queryItems: [URLQueryItem] = []
        
        switch self {
        case .everything(let query, let domains):
            
            if let query {
                queryItems.append(URLQueryItem(name: "q", value: query))
            }
        
            if let domains {
                queryItems.append(URLQueryItem(name: "domains", value: domains))
                
            }

            
        case .topHeadlines(let country, let category, let sources):
            if let country {
                queryItems.append(URLQueryItem(name: "country", value: country))
            }
            
            if let category {
                queryItems.append(URLQueryItem(name: "category", value: category))
            }
            
            if let sources {
                queryItems.append(URLQueryItem(name: "sources", value: sources))
            }
            
            
            
        case .topHeadlinesSources(let category, let language, let country):
            
            if let category {
                queryItems.append(
                    URLQueryItem(name:"category", value: category))
            }
            if let language {
                queryItems.append(URLQueryItem(name: "language", value: language))
            }
            
            
            if let country {
                queryItems.append(URLQueryItem(name: "country", value: country))
            }
        }
        
        components.queryItems = queryItems
        return components.url
    }
    // MARK: Method
    
    var method: HTTPMethod {
        switch self {
        case .everything,
                .topHeadlines,
                .topHeadlinesSources:
            return .get
        }
    }
}

