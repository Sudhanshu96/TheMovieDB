//
//  DefaultMoviesRepository.swift
//  TheMovieDB
//
//  Created by Sudhanshu Vohra on 19/11/22.
//

import Foundation

// MARK: Protocol for Movie Repository
protocol MoviesRepository {
    func fetchMovies(completion: @escaping (Result<[Movie], FetchError>) -> Void)
}

// MARK: Default implementation for Movie Repository
final class DefaultMoviesRepository: MoviesRepository {
    private let networkService: NetworkService
    private let decoder: JSONDecoder

    init(networkService: NetworkService,
         decoder: JSONDecoder = JSONDecoder()) {
        self.networkService = networkService
        self.decoder = decoder
    }

    func fetchMovies(completion: @escaping (Result<[Movie], FetchError>) -> Void) {
        let endpoint = APIEndpoints.getPopularMovies()
        networkService.requestData(with: endpoint) { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let data):
                do {
                    let movies = try self.decoder.decode(Movies.self, from: data)
                    completion(.success(movies.results))
                } catch let error {
                    completion(.failure(error.handleError()))
                }
            case .failure(let error):
                completion(.failure(error.handleError()))
            }
        }
    }
}

