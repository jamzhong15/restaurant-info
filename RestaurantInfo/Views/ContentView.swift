//
//  ContentView.swift
//  RestaurantInfo
//
//  Created by James Zhong on 01/04/2025.
//

import SwiftUI

struct ContentView: View {
    let restaurants: [Restaurant] = [
        Restaurant(name: "Restaurant Name", cuisines: ["Chinese", "Noodles"], rating: 4.8, address: "Example Address"),
        Restaurant(name: "Restaurant Name", cuisines: ["Chinese", "Noodles"], rating: 4.8, address: "Example Address"),
        
    ]
    
    @State private var postcode = "E1 6AN"

    var body: some View {
           NavigationStack {
               VStack {
                   TextField("Enter postcode", text: $postcode)
                       .textFieldStyle(.roundedBorder)
                       .padding(.horizontal)

                   ScrollView() {
                       LazyVStack(spacing: 5) {
                           ForEach(restaurants.prefix(10)) { restaurant in
                                RestaurantRowView(restaurant: restaurant)
                           }
                       }
                       .padding(.vertical)
                   }
               }
               .navigationTitle("Restaurant Locator")
           }
       }
}

#Preview {
    ContentView()
}
