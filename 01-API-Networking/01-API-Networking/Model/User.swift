//
//  User.swift
//  01-API-Networking
//
//  Created by D F on 6/12/26.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let email: String
    let first_name: String
    let last_name: String
}
