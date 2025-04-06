//
//  RestaurantInfoTests.swift
//  RestaurantInfoTests
//
//  Created by James Zhong on 01/04/2025.
//

import Testing
@testable import RestaurantInfo

struct RestaurantInfoTests {

    @Test func validPostcodesPass() {
            let viewModel = RestaurantViewModel()
            #expect(viewModel.isValidPostcode("W1A 1AA"))
            #expect(viewModel.isValidPostcode("EC1A 1BB"))
            #expect(viewModel.isValidPostcode("SW1A 0AA"))
        }

    @Test func invalidPostcodesFail() {
        let viewModel = RestaurantViewModel()
        #expect(!viewModel.isValidPostcode("12345"))
        #expect(!viewModel.isValidPostcode("Nope"))
        #expect(!viewModel.isValidPostcode("SW1A"))
    }
    
    @Test func coordinateReturnsCorrectValue() {
        let restaurant = Restaurant(
            id: "123",
            name: "Test Place",
            cuisines: [],
            rating: .init(starRating: 4.5),
            address: .init(
                firstLine: "1 Street",
                city: "London",
                location: .init(type: "Point", coordinates: [-0.1, 51.5])
            ),
            logoUrl: nil
        )

        let coordinate = restaurant.coordinate
        #expect(coordinate?.latitude == 51.5)
        #expect(coordinate?.longitude == -0.1)
    }

}
