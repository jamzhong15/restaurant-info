//
//  SearchBarView.swift
//  RestaurantInfo
//
//  Created by James Zhong on 04/04/2025.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var postcode: String
    var onSubmit: () -> Void
    var onFilterTap: () -> Void

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.orange)
            TextField("Enter postcode", text: $postcode)
                .textFieldStyle(.plain)
                .onSubmit { onSubmit() }
                .textInputAutocapitalization(.characters)
            Button {
                onFilterTap()
            } label: {
                Image(systemName: "slider.horizontal.3")
                    .foregroundColor(.orange)
            }
        }
        .padding(12)
        .background(Color(.systemBackground))
        .cornerRadius(15)
        .padding(20)
        .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 2)
    }
}
