//
//  NewsFeedViewModel.swift
//  02-Networking-NewsAPI
//
//  Created by D F on 6/15/26.
//

import Foundation
import Observation

struct FeedState: Equatable {
    var tab: NewsTab
    var category: NewsCategory
    var query: String
}

@MainActor
@Observable
final class NewsFeedViewModel {
    var articles: [Article] = []
    var selectedTab: NewsTab = .everything
    var selectedCategory: NewsCategory = .technology
    var selectedCountry: NewsCountry = .us
    var isLoading = false
    var searchQuery: String = ""
    
    func buildQuery() -> String {
        let trimmed = searchQuery.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmed.isEmpty ? selectedCategory.rawValue : trimmed
    }
    
    var feedState: FeedState {
        FeedState(
            tab: selectedTab,
            category: selectedCategory,
            query: searchQuery
        )
    }
    
    
    func fetch() async {
        
        print("FETCH STARTED")
        
        isLoading = true
        defer { isLoading = false }
        
        
        do {
            print("BEFORE REQUEST")
            switch selectedTab {
            case .everything:
                articles = try await APIClient.shared.fetchEverything(
                    query: buildQuery(),
                    domains: nil
                )
                
                
            case .topHeadlines:
                articles = try await APIClient.shared.fetchTopHeadlines(
                    country: selectedCountry.rawValue,
                    category: selectedCategory.rawValue
                )
                
            }
            
            print("Loaded:", articles.count)
        } catch {
            print("Error:", error)
        }
    }
}
