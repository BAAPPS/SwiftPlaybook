//
//  AppConfig.swift
//  01-API-Networking
//
//  Created by D F on 6/12/26.
//

import Foundation

enum AppConfig {
    static var apiKey: String {
        Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String ?? ""
    }
}
