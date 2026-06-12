//
//  KeychainService.swift
//  01-API-Networking
//
//  Created by D F on 6/12/26.
//

import Foundation
import Security

final class KeychainService {
    // singleton to always points to the same instance
    static let shared = KeychainService()
    private init() {}
    
    // MARK: - Save
    func save(_ value:String, for key: String) throws {
        let data = Data(value.utf8)
        
        try delete(key)
        
        // https://developer.apple.com/documentation/security/adding-a-password-to-the-keychain
        let query: [String:Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecValueData as String: data
        ]
       let status =  SecItemAdd(query as CFDictionary, nil)
        
        guard status == errSecSuccess else {
            throw KeychainError.unableToSave
        }
    }
    
    // MARK: - Read
    
    func read(_ key: String) throws -> String? {
        let query: [String:Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var result: AnyObject?
        
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        if status == errSecItemNotFound {
            return nil
        }
        
        guard status == errSecSuccess,
              let data = result as? Data,
              let value = String(data:data, encoding: .utf8) else {
            throw KeychainError.unableToRead
        }
        
        return value
    }
    
    
    // MARK: - Delete
    
    func delete(_ key:String) throws {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        
        if status != errSecSuccess && status != errSecItemNotFound {
            throw KeychainError.unableToDelete
        }
    }

  
    
    
}
