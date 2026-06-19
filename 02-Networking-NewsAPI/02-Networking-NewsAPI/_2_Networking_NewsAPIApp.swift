//
//  _2_Networking_NewsAPIApp.swift
//  02-Networking-NewsAPI
//
//  Created by D F on 6/12/26.
//

import SwiftUI

@main
struct _2_Networking_NewsAPIApp: App {
    @State private var nfVM = NewsFeedViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
                    .environment(nfVM)
            }
        }
    }
}
