//
//  Endpoint.swift
//  TheMovieDB
//
//  Created by Sudhanshu Vohra on 19/11/22.
//

import Foundation

final class Endpoint {
    let path: String
    let version: String

    init(path: String,
         version: String = "3") {
      // By Default API Version is "3" which is the current version
        self.path = path
        self.version = version
    }
}
