//
//  Restaurant.swift
//  RestaurantInfo
//
//  Created by James Zhong on 01/04/2025.
//

import Foundation
import CoreLocation

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
        let location: Location

        struct Location: Codable {
            let type: String
            let coordinates: [Double]
        }
    }
}

extension Restaurant {
    var coordinate: CLLocationCoordinate2D? {
        let coords = address.location.coordinates
        guard coords.count == 2 else { return nil }
        return CLLocationCoordinate2D(latitude: coords[1], longitude: coords[0])
    }
}
