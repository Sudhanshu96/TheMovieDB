//
//  DefaultImageRepository.swift
//  TheMovieDB
//
//  Created by Sudhanshu Vohra on 19/11/22.
//

import UIKit

// MARK: Protocol for Image Repository
protocol ImageRepository {
    func fetchImage(with imagePath: String, completion: @escaping (Result<UIImage, Error>) -> Void)
}

// Variable for image cache to store movie image cache
var movieImageCache = [String: MovieImage]()

// MARK: Default implementation for Image Repository
final class DefaultImageRepository: ImageRepository {
    private let networkService: NetworkService

    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    func fetchImage(with imagePath: String, completion: @escaping (Result<UIImage, Error>) -> Void) {

        if let cachedImage = movieImageCache[imagePath]{
            completion(.success(cachedImage.image))
            return
        }

        let endpoint = APIEndpoints.getMovieImage(path: imagePath)

        networkService.requestData(with: endpoint) { result in
            switch result {
            case .success(let data):
                guard let image = UIImage(data: data) else { return }
                movieImageCache[imagePath] = MovieImage(image: image)
                completion(.success(image))
            case .failure(let error):
                completion(.failure(error.handleError()))
            }
        }
    }
}
