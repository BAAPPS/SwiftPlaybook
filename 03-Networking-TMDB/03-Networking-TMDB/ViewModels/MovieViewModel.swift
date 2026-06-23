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
    var isLoading: Bool = false

    var state = MovieState()

    // MARK: - First fetch
    func fetchMovies() async {
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


            movies = response.results

        } catch {
            print("❌ fetchMovies error:", error)
        }
    }

    // MARK: - Pagination
    func loadMore() async {
        guard !isLoading else { return }

        isLoading = true
        defer { isLoading = false }

        do {
            currentPage += 1

            let endpoint = APIEndpoint.discoverMovies(
                page: currentPage,
                sortBy: state.movieSortBy
            )

            let response: PaginatedResponse<Movie> = try await APIClient.shared.request(
                endpoint: endpoint
            )

            movies.append(contentsOf: response.results)

        } catch {
            currentPage -= 1
            print("❌ loadMore error:", error)
        }
    }
}
