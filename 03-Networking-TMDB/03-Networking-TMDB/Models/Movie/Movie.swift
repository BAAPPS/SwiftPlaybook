//
//  Movie.swift
//  03-Networking-TMDB
//
//  Created by D F on 6/23/26.
//

import Foundation

struct Movie: Decodable {
    let adult: Bool
    let backdropPath: String?
    let genreIDs: [Int]
    let id: Int
    let title: String
    let originalLanguage: String
    let originalTitle: String
    let overview: String?
    let popularity: Double
    let posterPath: String?
    let releaseDate: Date?
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDs = "genre_ids"
        case id
        case title
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}


extension Movie {
    func posterURL(size: TMDBImageSize = .w500) -> URL? {
        guard let posterPath else { return nil }
        return URL(string: "\(TMDBImage.baseURL)/\(size.rawValue)\(posterPath)")
    }
    
    func backdropURL(size: TMDBImageSize = .w500) -> URL? {
        guard let backdropPath else { return nil }
        return URL(string: "\(TMDBImage.baseURL)/\(size.rawValue)\(backdropPath)")
    }
    

    static let mock = Movie(
        adult: false,
        backdropPath: "/6tROOVmV5vRymO2g52aR8kWlfoT.jpg",
        genreIDs: [10749, 35],
        id: 1392469,
        title: "Cocktail 2",
        originalLanguage: "hi",
        originalTitle: "कॉकटेल २",
        overview: "After a decade together, Diya and Kunal's relationship is shaken when Ally, an old friend, re-enters their lives. What begins as a plan between two women spirals into chaos, triggering hilarious, emotional rollercoaster none of them saw coming.",
        popularity: 550.095,
        posterPath: "/oIQmtByV1LtEQSwM4EpdLTyoSlM.jpg",
        releaseDate: TMDBDateHelper.formatter.date(from: "2026-06-19"),
        video: false,
        voteAverage: 5.7,
        voteCount: 7
    )
}
