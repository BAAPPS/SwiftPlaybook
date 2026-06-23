//
//  APIClient.swift
//  03-Networking-TMDB
//
//  Created by D F on 6/23/26.
//

import Foundation

final class APIClient {

    static let shared = APIClient()
    private init() {}

    func request<T: Decodable>(
        endpoint: APIEndpoint
    ) async throws -> T {
        
        guard let url = endpoint.url else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        print("🌍 URL:", url.absoluteString)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let http = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard (200...299).contains(http.statusCode) else {
            throw NetworkError.serverError(statusCode: http.statusCode)
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(TMDBDateHelper.formatter)
        
        return try decoder.decode(T.self, from: data)
    }
}
