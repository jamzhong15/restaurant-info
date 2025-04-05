//
//  RestaurantMapView.swift
//  RestaurantInfo
//
//  Created by James Zhong on 04/04/2025.
//

import SwiftUI
import MapKit

struct RestaurantMapView: View {
    @Binding var region: MKCoordinateRegion
    let restaurants: [Restaurant]
    @Binding var selectedID: String?

    var body: some View {
            Map(coordinateRegion: $region, annotationItems: restaurants.filter { $0.coordinate != nil }) { restaurant in
                MapAnnotation(coordinate: restaurant.coordinate!) {
                    
                    // Show restaurant name on select
                    if selectedID == restaurant.id {
                        Text(restaurant.name)
                            .font(.caption)
                            .padding(6)
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .shadow(radius: 3)
                    }
                    
                    Image(systemName: "fork.knife.circle.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.orange)
                        .onTapGesture {
                            if selectedID == restaurant.id {
                                selectedID = nil // Dismiss if tapped already
                            } else {
                                selectedID = restaurant.id
                            }
                        }
                }
            }
            .ignoresSafeArea()
    }
}
