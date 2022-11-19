//
//  APIEndpoints.swift
//  TheMovieDB
//
//  Created by Sudhanshu Vohra on 19/11/22.
//

import Foundation

struct APIEndpoints {
  
  static func getPopularMovies() -> Endpoint {
    return Endpoint(path: "movie/now_playing")
  }
  
  static func getMovieImage(path: String) -> Endpoint {
    return Endpoint(path: "t/p/w500/\(path)", version: "")
  }
}
