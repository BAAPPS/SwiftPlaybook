//
//  APIClient.swift
//  02-Networking-NewsAPI
//
//  Created by D F on 6/15/26.
//

import Foundation

final class APIClient {
    static let shared = APIClient()
    
    // MARK: - Generic Request Handler
    
    private func request<T:Decodable>(
        endpoint: APIEndpoint,
        body: Encodable? = nil,
        responseType: T.Type
        
    ) async throws -> T{
        
        guard let url = endpoint.url else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url:url)
        request.httpMethod = endpoint.method.rawValue
        
        // MARK: Headers
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        print("🔑 API KEY VALUE:", AppConfig.apiKey)
        request.setValue(AppConfig.apiKey, forHTTPHeaderField: "X-Api-Key")
        
        // MARK: Body
        
        if let body {
            request.httpBody = try JSONEncoder().encode(body)
        }
        
        // MARK: Debug
        print("🌍 URL:", url.absoluteString)
        print("📨 METHOD:", endpoint.method)
        
//        if let bodyData = request.httpBody {
//            print("📦 BODY:")
//            print(String(data: bodyData, encoding: .utf8) ?? "nil")
//        }
//        
        
        // MARK: Execute
        
        let (data,response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        print("📡 STATUS:", httpResponse.statusCode)
//        print("📥 RESPONSE:", String(data: data, encoding: .utf8) ?? "nil")
        
        guard (200...209).contains(httpResponse.statusCode) else {
            throw NetworkError.serverError(statusCode: httpResponse.statusCode)
        }
        
        
        return try JSONDecoder().decode(T.self, from: data)
        
    }
    
    
    // MARK: - EVERYTHING
    
    func fetchEverything(query: String?, domains: String?) async throws -> [Article] {
        let response: NewsResponse = try await request(
            endpoint: .everything(query: query, domains: domains),
            responseType: NewsResponse.self
        )

        return response.articles
    }
    
    // MARK: - TOP HEADLINES
   
    func fetchTopHeadlines(
        country: String? = nil,
        category: String? = nil,
        sources: String? = nil,
    ) async throws -> [Article] {

        let response: NewsResponse = try await request(
            endpoint: .topHeadlines(
                country: country,
                category: category,
                sources: sources
            ),
            responseType: NewsResponse.self
        )

        return response.articles
    }
    
}
