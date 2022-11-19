//
//  MovieListCellViewModel.swift
//  TheMovieDB
//
//  Created by Sudhanshu Vohra on 19/11/22.
//

import Foundation
import UIKit

final class MovieListCellViewModel {
    private let movie: Movie
    private let imageRepository: ImageRepository

    var movieTitle: String {
        return movie.title
    }

    var rating: String {
        return "Rating - \(movie.voteAverage)"
    }

    init(movie: Movie, imageRepository: ImageRepository) {
        self.movie = movie
        self.imageRepository = imageRepository
    }

    func getImage(completion: @escaping (UIImage?) -> Void) {
        imageRepository.fetchImage(with: movie.posterImageURLPath) { result in
            switch result {
            case .success(let image):
                completion(image)
            case .failure:
                completion(nil)
            }
        }
    }
}
