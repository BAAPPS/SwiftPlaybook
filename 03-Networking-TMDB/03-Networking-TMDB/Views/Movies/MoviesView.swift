//
//  MoviesView.swift
//  03-Networking-TMDB
//
//  Created by D F on 6/23/26.
//

import SwiftUI

struct MoviesView: View {
    @Environment(MovieViewModel.self) var moviesVM
    
    
    var body: some View {
        VStack {
            List {
                ForEach(moviesVM.movies, id: \.id) { movie in
                    MovieRowView(movie:movie)
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("Discover Movies")
        .navigationBarTitleDisplayMode(.large)
        .task {
            await moviesVM.fetchMovies()
        }
    }
}

#Preview {
    NavigationStack {
        MoviesView()
            .environment(MovieViewModel())
    }
}
