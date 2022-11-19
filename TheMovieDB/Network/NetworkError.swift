//
//  NetworkError.swift
//  TheMovieDB
//
//  Created by Sudhanshu Vohra on 19/11/22.
//

import Foundation

enum NetworkError: Error {
    case noContentReturned
    case httpError(statusCode: Int)
    case nonFatal(error: Error)

    var message: String {
        switch self {
        case .noContentReturned, .nonFatal:
            return "An unknown error occured"
        case .httpError(let statusCode):
            return "\(statusCode) Error occured"
        }
    }
}
