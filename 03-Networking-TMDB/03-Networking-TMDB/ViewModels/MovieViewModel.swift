//
//  MovieViewModel.swift
//  03-Networking-TMDB
//
//  Created by D F on 6/23/26.
//

import Foundation
import Observation

struct MovieState: Equatable {
    var movieSortBy: MovieSortBy = .primaryReleaseDateDesc
}



@MainActor
@Observable
final class MovieViewModel {

    var movies: [Movie] = []
    var currentPage: Int = 1
    var totalPages: Int =  1
    var totalResults: Int = 0
    var isLoading: Bool = false

    var state = MovieState()

    // MARK: - First fetch
    func fetchMovies() async {
        guard movies.isEmpty else { return }
        guard !isLoading else { return }
        
        isLoading = true
        defer { isLoading = false }

        do {
            let endpoint = APIEndpoint.discoverMovies(
                page: currentPage,
                sortBy: state.movieSortBy,
                year: Calendar.current.component(.year, from: Date()) // 2026
            )

            let response: PaginatedResponse<Movie> = try await APIClient.shared.request(
                endpoint: endpoint
            )
            
            print("✅ PAGE:", response.page)
            print("✅ RESULTS COUNT:", response.results.count)
            print("✅ TOTAL PAGES:", response.totalPages)
            print("✅ TOTAL RESULTS:", response.totalResults)


            movies = response.results
            currentPage = response.page
            totalPages = response.totalPages
            totalResults = response.totalResults

        } catch {
            print("❌ fetchMovies error:", error)
        }
    }

    // MARK: - Pagination
    func loadMore() async {
        guard !isLoading else { return }
        
        guard currentPage < totalPages else {
             print("🚫 No more pages")
             return
         }

        isLoading = true
        defer { isLoading = false }

        do {
            let nextPage = currentPage + 1

            let endpoint = APIEndpoint.discoverMovies(
                page: nextPage,
                sortBy: state.movieSortBy
            )
            

            let response: PaginatedResponse<Movie> = try await APIClient.shared.request(
                endpoint: endpoint
            )
            
            currentPage = response.page
            totalPages = response.totalPages
            totalResults = response.totalResults

            movies.append(contentsOf: response.results)

        } catch {
            print("❌ loadMore error:", error)
        }
    }
    
    func loadMoreIfNeeded(for movie: Movie) async {
        guard movie.id == movies.last?.id else {return}
        
        await loadMore()
    }
}
