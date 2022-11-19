//
//  DynamicType.swift
//  TheMovieDB
//
//  Created by Sudhanshu Vohra on 19/11/22.
//

import Foundation

class DynamicType<T> {
    public init() {}

    public var listeners: [(T) -> Void] = []

    public var value: T? {
        didSet {
            for listener in listeners {
                if let value = value {
                    listener(value)
                }
            }
        }
    }

    public func bind(listener: @escaping (T) -> Void) {
        listeners.append(listener)
        if let value = value {
            listener(value)
        }
    }
}
