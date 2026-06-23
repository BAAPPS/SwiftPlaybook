//
//  TMDBDateHelper.swift
//  03-Networking-TMDB
//
//  Created by D F on 6/23/26.
//

import Foundation

enum TMDBDateHelper {
    static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
    
}


extension TMDBDateHelper {
    static func formatDisplayDate(_ date: Date) -> String {
        date.formatted(date: .abbreviated, time: .omitted)
    }
}
