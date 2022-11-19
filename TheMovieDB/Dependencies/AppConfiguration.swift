//
//  AppConfiguration.swift
//  TheMovieDB
//
//  Created by Sudhanshu Vohra on 19/11/22.
//

import Foundation

final class AppConfiguration {
    lazy var apiKey: String = {
        // TODO(Sudhanshu): Store in PList
        return "38a73d59546aa378980a88b645f487fc"
    }()

    lazy var apiBaseURL: String = {
        return "https://api.themoviedb.org/"
    }()

    lazy var imageBaseURL: String = {
        return "https://image.tmdb.org/"
    }()
}
