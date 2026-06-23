//
//  _3_Networking_TMDBApp.swift
//  03-Networking-TMDB
//
//  Created by D F on 6/23/26.
//

import SwiftUI

@main
struct _3_Networking_TMDBApp: App {
    @State private var movieVM = MovieViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                ContentView()
                    .environment(movieVM)
            }
        }
    }
}
