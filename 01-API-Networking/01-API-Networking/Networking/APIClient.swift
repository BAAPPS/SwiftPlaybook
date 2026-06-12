//
//  APIClient.swift
//  01-API-Networking
//
//  Created by D F on 6/12/26.
//

import Foundation


final class APIClient {
    static let shared = APIClient()
    
    // MARK: - Generic Request Handler
    
    
    private func request<T:Decodable>(
        endpoint: APIEndpoint,
        body: Encodable? = nil,
        responseType: T.Type
    ) async throws -> T {
        var request = URLRequest(url: endpoint.url)
        request.httpMethod = endpoint.method
        
        // MARK: Headers
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        print("🔑 API KEY VALUE:", AppConfig.apiKey)
        request.setValue(AppConfig.apiKey, forHTTPHeaderField: "x-api-key")
        
        // MARK: Auth
        if let token = TokenManager.shared.getToken() {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        // MARK: Body
        if let body {
            request.httpBody = try JSONEncoder().encode(body)
        }
        
        // MARK: Debug
        print("🌍 URL:", endpoint.url.absoluteString)
        print("📨 METHOD:", endpoint.method)
        
        if let bodyData = request.httpBody {
            print("📦 BODY:")
            print(String(data: bodyData, encoding: .utf8) ?? "nil")
        }
        
        // MARK: Execute
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        print("📡 STATUS:", httpResponse.statusCode)
        print("📥 RESPONSE:", String(data: data, encoding: .utf8) ?? "nil")
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.serverError(statusCode: httpResponse.statusCode)
        }
        
        return try JSONDecoder().decode(T.self, from: data)
        
    }
    
    // MARK: - LOGIN
    
    func login(email:String, password:String) async throws -> String {
        struct LoginRequest: Encodable {
            let email: String
            let password: String
        }
        
        let body = LoginRequest(email:email, password:password)
        
        let response: LoginResponse = try await request(
            endpoint: .login,
            body: body,
            responseType: LoginResponse.self
        )
        
        return response.token
    }
    
    // MARK: - USERS
    
    func fetchUsers(page: Int) async throws -> [User] {
        let response: UserResponse = try await request(
            endpoint: .users(page:page),
            responseType: UserResponse.self
        )
        return response.data
    }
    
}
