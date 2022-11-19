//
//  MovieImage.swift
//  TheMovieDB
//
//  Created by Sudhanshu Vohra on 19/11/22.
//

import Foundation
import UIKit

struct MovieImage: Equatable {
    static func == (lhs: MovieImage, rhs: MovieImage) -> Bool {
        return lhs.image == rhs.image
    }

    let image: UIImage
}
