//
//  JSONLoader.swift
//  RestaurantInfo
//
//  Created by James Zhong on 04/04/2025.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Missing file: \(file)")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file)")
        }

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .useDefaultKeys
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file)")
        }

        return loaded
    }
}
