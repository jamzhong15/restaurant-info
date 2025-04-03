//
//  Restaurant.swift
//  RestaurantInfo
//
//  Created by James Zhong on 01/04/2025.
//

import Foundation

struct Restaurant: Codable, Identifiable {
    let id: String
    let name: String
    let cuisines: [Cuisine]
    let rating: Rating
    let address: Address
    let logoUrl: String?

    struct Cuisine: Codable {
        let name: String
    }

    struct Rating: Codable {
        let starRating: Double
    }

    struct Address: Codable {
        let firstLine: String
        let city: String
    }
}
