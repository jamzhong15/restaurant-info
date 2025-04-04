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

    var body: some View {
            Map(coordinateRegion: $region, annotationItems: restaurants.filter { $0.coordinate != nil }) { restaurant in
                MapAnnotation(coordinate: restaurant.coordinate!) {
                    Image(systemName: "fork.knife.circle.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.orange)
                }
            }
            .ignoresSafeArea()
    }
}
