//
//  NewsFeedViewModel.swift
//  02-Networking-NewsAPI
//
//  Created by D F on 6/15/26.
//

import Foundation
import Observation

@MainActor
@Observable
final class NewsFeedViewModel {
    var articles: [Article] = []
    var selectedTab: NewsTab = .everything
    var selectedCategory: NewsCategory = .technology
    var isLoading = false
    
    func fetch() async {
       
        print("FETCH STARTED")

        isLoading = true
        defer { isLoading = false }

        
        do {
            print("BEFORE REQUEST")
            switch selectedTab {
            case .everything:
                articles = try await APIClient.shared.fetchEverything(
                    query:  selectedCategory.rawValue,
                    domains: nil
                )
                
                
            case .topHeadlines:
                articles = try await APIClient.shared.fetchTopHeadlines(
                    country: "us",
                    category: selectedCategory.rawValue
                )
                
            }
            
            print("Loaded:", articles.count)
        } catch {
            print("Error:", error)
        }
    }
}
