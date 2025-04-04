//
//  RestaurantPanelView.swift
//  RestaurantInfo
//
//  Created by James Zhong on 04/04/2025.
//

import SwiftUI

struct RestaurantPanelView: View {
    let restaurants: [Restaurant]
    let minimumRating: Double?
    @Binding var offset: CGFloat
    @GestureState private var dragOffset: CGFloat = 0

    var body: some View {
        VStack(spacing: 5) {
            Capsule()
                .frame(width: 40, height: 6)
                .foregroundColor(.gray.opacity(0.3))
                .padding(.top, 8)

            ScrollView {
                LazyVStack(spacing: 1) {
                    ForEach(restaurants.prefix(10)) { restaurant in
                        RestaurantRowView(restaurant: restaurant)
                    }
                }
                .padding()
            }
        }
        .background(.ultraThinMaterial)
        .cornerRadius(20)
        .shadow(radius: 10)
        .offset(y: offset + dragOffset)
        .gesture(
            DragGesture()
                .updating($dragOffset) { value, state, _ in
                    state = value.translation.height
                }
                .onEnded { value in
                    let newOffset = offset + value.translation.height
                    withAnimation {
                        offset = newOffset < 200 ? 100 : 300
                    }
                }
        )
        .ignoresSafeArea(edges: .bottom)
    }
}

