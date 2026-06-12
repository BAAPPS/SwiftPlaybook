//
//  TokenManager.swift
//  01-API-Networking
//
//  Created by D F on 6/12/26.
//

import Foundation

final class TokenManager {
    static let shared = TokenManager()
    
    private let key = "auth_token"
    
    func saveToken(_ token: String) {
        try? KeychainService.shared.save(token, for: key)
    }
    
    func getToken() -> String? {
        try? KeychainService.shared.read(key)
    }
    
    func deleteToken() {
        try? KeychainService.shared.delete(key)
    }
    
    func logout() {
        deleteToken()
    }
    
    var isLoggedIn: Bool {
        getToken() != nil
    }
}
