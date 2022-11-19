//
//  Error+Extensions.swift
//  TheMovieDB
//
//  Created by Sudhanshu Vohra on 19/11/22.
//

import Foundation

extension Error {
    func handleError() -> FetchError {
        guard let networkError = self as? NetworkError else {
            return FetchError(message: self.localizedDescription)
        }
        return FetchError(message: networkError.message)
    }
}
