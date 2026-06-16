//
//  NewsTabBarView.swift
//  02-Networking-NewsAPI
//
//  Created by D F on 6/16/26.
//

import SwiftUI

struct NewsTabBarView: View {
    @Binding var selectedTab: NewsTab
    var body: some View {
        HStack(spacing:12) {
            ForEach(NewsTab.allCases, id:\.self) {tab in
                Button {
                    selectedTab = tab
                } label: {
                    Text(tab.rawValue)
                        .font(.subheadline)
                        .fontWeight(
                            selectedTab == tab ? .semibold : .regular
                        )
                        .foregroundStyle(
                            selectedTab == tab ?
                                .white : .primary
                        )
                        .padding(.horizontal, 16)
                        .padding(.vertical, 15)
                        .background {
                            Capsule()
                                .fill(
                                    selectedTab == tab ?
                                        .blue : .gray.opacity(0.15)
                                )
                        }
                    
                }
                .buttonStyle(.plain)
                
            }
        }
        .padding(.horizontal)
        .padding(.top, 10)
    }
}

#Preview {
    NewsTabBarView(
        selectedTab: .constant(.everything)
    )
}
