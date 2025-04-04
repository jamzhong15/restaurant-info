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
    @State private var showingFilterSheet = false
    

    var body: some View {
        NavigationStack {
            ZStack {
                
                Color(.systemGray6)
                    .ignoresSafeArea()
                
                VStack(spacing: 16) {
                    // Postcode input
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.orange)
                            .font(.title2)
                        
                        TextField("Enter postcode", text: $postcode)
                            .textFieldStyle(.plain)
                            .onSubmit {
                                if viewModel.isValidPostcode(postcode) {
                                        viewModel.fetchRestaurants(for: postcode)
                                    } else {
                                        viewModel.errorMessage = "Please enter a valid UK postcode."
                                    }
                            }
                            .textInputAutocapitalization(.characters)
                        
                        Button {
                                showingFilterSheet = true
                            } label: {
                                Image(systemName: "slider.horizontal.3")
                                    .foregroundColor(.orange)
                                    .font(.title3)
                            }
                    }
                    .padding(12)
                    .background(Color(.systemGray5))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    
                    // Loading state
                    if viewModel.isLoading {
                        ProgressView("Loading restaurants...")
                            .padding()
                    }
                    
                    // Error state
                    if let error = viewModel.errorMessage {
                        Text(error)
                            .foregroundColor(.red)
                            .padding(.horizontal)
                    }
                    
                    // Restaurant list
                    ScrollView {
                        LazyVStack(spacing: 1) {
                            ForEach(viewModel.filteredRestaurants.prefix(10)) { restaurant in
                                RestaurantRowView(restaurant: restaurant)
                            }
                        }
                        .padding(.vertical)
                    }
                    
                }
                .padding(.top)
                .navigationTitle("Nearby Restaurants")
                .navigationBarTitleDisplayMode(.inline)
                .sheet(isPresented: $showingFilterSheet) {
                    FilterSheet(
                        selectedRating: $viewModel.minimumRating
                    )
                }
            }
        }
    }
    
}

#Preview {
    ContentView()
}
