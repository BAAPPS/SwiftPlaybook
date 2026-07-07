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
                Section {
                    ForEach(moviesVM.movies, id: \.id) { movie in
                        
                        NavigationLink {
                            MovieDetailView(movie: movie)
                        }  label: {
                            MovieRowView(movie: movie)
                        }
                        .onAppear {
                            Task {
                                await moviesVM.loadMoreIfNeeded(for: movie)
                            }
                        }
                    }
                } header: {
                    HStack{
                        Text("\(moviesVM.totalResults.formatted())")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundStyle(.black.opacity(0.7))
                        Text("movies found")
                            .font(.system(size: 18))
                            .foregroundStyle(.black.opacity(0.7))
                        
                    }
                    .frame(maxWidth:.infinity, alignment: .center)
                }
                if moviesVM.isLoading {
                    ProgressView()
                }
            }
            
        }
        .navigationTitle("Future Movies")
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
