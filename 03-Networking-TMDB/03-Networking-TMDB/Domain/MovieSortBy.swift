//
//  SortBy.swift
//  03-Networking-TMDB
//
//  Created by D F on 6/23/26.
//

import Foundation

enum MovieSortBy: String {
    case originalTitleAsc = "original_title.asc"
    case originalTitleDesc = "original_title.desc"

    case popularityAsc = "popularity.asc"
    case popularityDesc = "popularity.desc"

    case revenueAsc = "revenue.asc"
    case revenueDesc = "revenue.desc"

    case primaryReleaseDateAsc = "primary_release_date.asc"
    case primaryReleaseDateDesc = "primary_release_date.desc"

    case titleAsc = "title.asc"
    case titleDesc = "title.desc"

    case voteAverageAsc = "vote_average.asc"
    case voteAverageDesc = "vote_average.desc"

    case voteCountAsc = "vote_count.asc"
    case voteCountDesc = "vote_count.desc"
}
