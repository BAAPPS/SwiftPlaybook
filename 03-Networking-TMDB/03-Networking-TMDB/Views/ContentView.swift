//
//  ContentView.swift
//  03-Networking-TMDB
//
//  Created by D F on 6/23/26.
//

import SwiftUI

struct ContentView: View {
    @Environment(MovieViewModel.self) var movieVM
    var body: some View {
        VStack {
           MoviesView()
                .environment(movieVM)
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
            .environment(MovieViewModel())
    }
}
