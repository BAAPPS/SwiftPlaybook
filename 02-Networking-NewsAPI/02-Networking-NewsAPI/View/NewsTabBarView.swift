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
        HStack(spacing:0) {
            ForEach(NewsTab.allCases, id:\.self) {tab in
                Button {
                    selectedTab = tab
                } label: {
                    Text(tab.rawValue)
                        .frame(maxWidth: .infinity)
                        .font(.system(size: 20))
                        .fontWeight(
                            selectedTab == tab ? .bold : .semibold
                        )
                        .foregroundStyle(
                            selectedTab == tab ?
                                .white : .black.opacity(0.8)
                        )
                        .padding(.horizontal, 16)
                        .padding(.vertical, 15)
                }
                .buttonStyle(.plain)
                .background( selectedTab == tab ? Color(
                    red: 26/255,
                    green: 115/255,
                    blue: 232/255
                ) : Color.clear)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(
                    color: .black.opacity(0.12),
                    radius: 12,
                    x: 0,
                    y: 4
                )
                
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
    .frame(maxWidth:.infinity)
    .background(Color.white)
    
}
