//
//  Movies.swift
//  TheMovieDB
//
//  Created by Sudhanshu Vohra on 19/11/22.
//

import Foundation

struct Movies: Codable {
    let results: [Movie]
}

struct Movie: Codable, Equatable {
    let id: Int
    let title: String
    let releaseDate: String
    let backdropPath: String
    let posterImageURLPath: String
    let voteAverage: Float

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "original_title"
        case releaseDate = "release_date"
        case backdropPath = "backdrop_path"
        case posterImageURLPath = "poster_path"
        case voteAverage = "vote_average"
    }
}
