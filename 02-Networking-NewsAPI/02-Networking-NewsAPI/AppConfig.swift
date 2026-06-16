//
//  AppConfig.swift
//  02-Networking-NewsAPI
//
//  Created by D F on 6/15/26.
//

import Foundation

enum AppConfig {
    static var apiKey:String {
        Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String ?? ""
    }
}
