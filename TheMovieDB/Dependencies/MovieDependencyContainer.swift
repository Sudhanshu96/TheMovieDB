//
//  MovieDependencyContainer.swift
//  TheMovieDB
//
//  Created by Sudhanshu Vohra on 19/11/22.
//

import Foundation

final class Dependencies {
    let networkService: NetworkService
    let imageService: NetworkService

    init(networkService: NetworkService,
         imageService: NetworkService) {
        self.networkService = networkService
        self.imageService = imageService
    }
}

final class MoviesDependancyContainer {
  private let dependencies: Dependencies
  
  init(appConfiguration: AppConfiguration = AppConfiguration()) {
    
    func makeDependencies() -> Dependencies {
        let networkService = makeNetworkService()
        let imageService = makeImageService()
        return Dependencies(networkService: networkService,
                            imageService: imageService)
    }

    func makeNetworkService() -> NetworkService {
        let config = ApiDataNetworkConfig(baseURL: URL(string: appConfiguration.apiBaseURL)!,
                                          queryParameters: ["api_key": appConfiguration.apiKey])
        return DefaultNetworkService(config: config)
    }

    func makeImageService() -> NetworkService {
        let config = ApiDataNetworkConfig(baseURL: URL(string: appConfiguration.imageBaseURL)!)
        return DefaultNetworkService(config: config)
    }
    
    self.dependencies = makeDependencies()
  }
  
  // MARK: - Movie List
  func makeMovieListViewController() -> MovieListViewController {
    let movieListViewModel = makeMovieListViewModel()
    let imageRepository = DefaultImageRepository(networkService: dependencies.imageService)
    
    let movieListCellViewModelFactory = { (movie: Movie) in
      return self.makeMovieListCellViewModel(movie: movie, imageRepository: imageRepository)
    }
    
    return MovieListViewController(movieListViewModel: movieListViewModel,
                                   imageRepository: imageRepository,
                                   movieListCellViewModelFactory: movieListCellViewModelFactory)
  }
  
  private func makeMovieListViewModel() -> MovieListViewModel {
    let movieRepository = DefaultMoviesRepository(networkService: dependencies.networkService)
    return MovieListViewModel(movieRepository: movieRepository)
  }
  
  private func makeMovieListCellViewModel(movie: Movie, imageRepository: ImageRepository) -> MovieListCellViewModel {
    return MovieListCellViewModel(movie: movie, imageRepository: imageRepository)
  }
}
