//
// View+Searchable.swift
//  02-Networking-NewsAPI
//
//  Created by D F on 6/19/26.
//

import Foundation
import SwiftUI


struct SearchableModifier: ViewModifier {
    @Bindable var nfVM: NewsFeedViewModel
    
    func body(content:Content) -> some View {
        
        if nfVM.selectedTab == .everything {
            content.searchable(
                text: $nfVM.searchQuery,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: "Search news"
            )
        } else {
            content
        }
    }
}


extension View {
    func searchableIfEverything(_ vm:NewsFeedViewModel) -> some View {
        modifier(SearchableModifier(nfVM:vm))
    }
}
