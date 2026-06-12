//
//  KeychainError.swift
//  01-API-Networking
//
//  Created by D F on 6/12/26.
//

import Foundation

enum KeychainError: Error {
    case unableToSave
    case unableToRead
    case unableToDelete
}
