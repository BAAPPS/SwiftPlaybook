//
//  NewsCategory.swift
//  02-Networking-NewsAPI
//
//  Created by D F on 6/15/26.
//

import Foundation


enum NewsCategory: String, CaseIterable {
    case business
    case entertainment
    case general
    case health
    case science
    case sports
    case technology
    
    var title: String {
           switch self {
           case .business: "Business"
           case .entertainment: "Entertainment"
           case .general: "General"
           case .health: "Health"
           case .science: "Science"
           case .sports: "Sports"
           case .technology: "Technology"
           }
       }
}
