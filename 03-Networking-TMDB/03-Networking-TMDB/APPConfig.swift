//
//  APPConfig.swift
//  03-Networking-TMDB
//
//  Created by D F on 6/23/26.
//

import Foundation

enum AppConfig {
    static var apiKey:String {
        Bundle.main.object(forInfoDictionaryKey:"API_KEY") as? String ?? ""
    }
}
