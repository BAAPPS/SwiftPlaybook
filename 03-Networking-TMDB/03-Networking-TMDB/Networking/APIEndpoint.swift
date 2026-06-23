//
//  APIEndpoint.swift
//  03-Networking-TMDB
//
//  Created by D F on 6/23/26.
//

import Foundation

enum APIEndpoint {

    case discoverMovies(
        language: String? = nil,
        page: Int = 1,
        sortBy: MovieSortBy = .primaryReleaseDateDesc,
        year: Int? = nil
    )

    // MARK: - Base config
    private var baseURL: String {
        "https://api.themoviedb.org/3/discover"
    }

    private var path: String {
        switch self {
        case .discoverMovies:
            return "/movie"
        }
    }

    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.path = "/3/discover" + path

        var queryItems: [URLQueryItem] = []

        switch self {

        case let .discoverMovies(language, page, sortBy, year):

            // REQUIRED for TMDB (API key)
            queryItems.append(.init(name: "api_key", value: AppConfig.apiKey))

            if let language {
                queryItems.append(.init(name: "language", value: language))
            }

            queryItems.append(.init(name: "page", value: String(page)))
            queryItems.append(.init(name: "sort_by", value: sortBy.rawValue))

            if let year {
                queryItems.append(.init(name: "year", value: String(year)))
            }
        }

        components.queryItems = queryItems
        return components.url
    }

    var method: HTTPMethod {
        .get
    }
}
