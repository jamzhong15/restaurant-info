//
//  ContentView.swift
//  RestaurantInfo
//
//  Created by James Zhong on 01/04/2025.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var postcode = ""
    @StateObject private var viewModel = RestaurantViewModel()
    @State private var showingFilterSheet = false
    @State private var mapRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 51.5074, longitude: -0.1278),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    @State private var panelOffset: CGFloat = 400 // starting height
    @State private var hasSearched = false
    @State private var selectedRestaurantID: String? = nil
    

    var body: some View {
        NavigationStack {
            ZStack {
                
                RestaurantMapView(
                    region: $mapRegion,
                    restaurants: Array(viewModel.filteredRestaurants.prefix(10)),
                    selectedID: $selectedRestaurantID
                )
                
                VStack(spacing: 16) {
                    SearchBarView(
                        postcode: $postcode,
                        onSubmit: {
                            if viewModel.isValidPostcode(postcode) {
                                viewModel.fetchRestaurants(for: postcode)
                                hasSearched = true
                                
                                // Focus map on postcode
                                viewModel.focusMap(on: postcode) { coordinate in
                                    if let coordinate = coordinate {
                                        mapRegion = MKCoordinateRegion(
                                            center: coordinate,
                                            span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
                                        )
                                    }
                                }
                            } else {
                                viewModel.errorMessage = "Please enter a valid UK postcode."
                            }
                        },
                        onFilterTap: {
                            showingFilterSheet = true
                        }
                    )
                    
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
                    if hasSearched {
                        RestaurantPanelView(
                            restaurants: viewModel.filteredRestaurants,
                            minimumRating: viewModel.minimumRating,
                            offset: $panelOffset
                        )
                    }
                    
                    Spacer()
                    
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
