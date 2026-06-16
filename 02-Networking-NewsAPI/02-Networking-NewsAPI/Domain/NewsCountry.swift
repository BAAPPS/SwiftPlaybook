//
//  NewsCountry.swift
//  02-Networking-NewsAPI
//
//  Created by D F on 6/15/26.
//

import Foundation

enum NewsCountry: String, Codable, CaseIterable {
    case us, gb, ca, au, de, fr, in_, jp, kr, cn
}

extension NewsCountry {
    var displayName: String {
        switch self {
        case .us: return "United States"
        case .gb: return "United Kingdom"
        case .ca: return "Canada"
        case .au: return "Australia"
        case .de: return "Germany"
        case .fr: return "France"
        case .in_: return "India"
        case .jp: return "Japan"
        case .kr: return "South Korea"
        case .cn: return "China"
        }
    }
    
    
    var flag: String {
        switch self {
        case .us: return "🇺🇸"
        case .gb: return "🇬🇧"
        case .ca: return "🇨🇦"
        case .au: return "🇦🇺"
        case .de: return "🇩🇪"
        case .fr: return "🇫🇷"
        case .in_: return "🇮🇳"
        case .jp: return "🇯🇵"
        case .kr: return "🇰🇷"
        case .cn: return "🇨🇳"
        }
    }


    var code: String {
        switch self {
        case .in_: return "in"
        default: return rawValue
        }
    }
}
