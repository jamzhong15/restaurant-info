//
//  ContentView.swift
//  RestaurantInfo
//
//  Created by James Zhong on 01/04/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var postcode = ""
    @StateObject private var viewModel = RestaurantViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                // 🔹 Postcode input
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.orange)

                    TextField("Enter postcode", text: $postcode)
                        .textFieldStyle(.plain)
                        .onSubmit {
                            viewModel.fetchRestaurants(for: postcode)
                        }
                }
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)

                // 🔹 Loading state
                if viewModel.isLoading {
                    ProgressView("Loading restaurants...")
                        .padding()
                }

                // 🔹 Error state
                if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .padding(.horizontal)
                }

                // 🔹 Restaurant list
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(viewModel.restaurants.prefix(10)) { restaurant in
                            RestaurantRowView(restaurant: restaurant)
                        }
                    }
                    .padding(.vertical)
                }

                Spacer()
            }
            .padding(.top)
            .navigationTitle("Nearby Restaurants")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    ContentView()
}
