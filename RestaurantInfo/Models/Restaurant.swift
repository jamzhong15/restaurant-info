//
//  Restaurant.swift
//  RestaurantInfo
//
//  Created by James Zhong on 01/04/2025.
//

import Foundation

struct Restaurant: Identifiable, Codable {
    var id = UUID()
    let name: String
    let cuisines: [String]
    let rating: Double
    let address: String
}
