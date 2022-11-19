//
//  NetworkService.swift
//  TheMovieDB
//
//  Created by Sudhanshu Vohra on 19/11/22.
//

import Foundation

protocol NetworkService {
    func requestData(with endpoint: Endpoint, completion: @escaping (Result<Data, NetworkError>) -> Void)
}

