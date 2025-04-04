//
//  FilterView.swift
//  RestaurantInfo
//
//  Created by James Zhong on 04/04/2025.
//

import SwiftUI

struct FilterSheet: View {
    @Binding var selectedRating: Double?

    @State private var tempSelectedRating: Double? = nil

    let options: [Double] = [1, 2, 3, 4, 5]

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("Select Minimum Rating")
                    .font(.headline)
                    .padding(.horizontal)

                HStack(spacing: 12) {
                    ForEach(options, id: \.self) { rating in
                        Button {
                            tempSelectedRating = (tempSelectedRating == rating) ? nil : rating
                        } label: {
                            HStack(spacing: 2) {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.orange)
                                    .font(.caption)
                                Text("\(Int(rating))")
                                    .font(.caption)
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(
                                tempSelectedRating == rating
                                    ? Color.orange.opacity(0.2)
                                    : Color(.systemGray5)
                            )
                            .foregroundColor(.primary)
                            .clipShape(Capsule())
                            .overlay(
                                Capsule()
                                    .stroke(tempSelectedRating == rating ? Color.orange : Color.clear, lineWidth: 1)
                            )
                        }
                        .animation(.easeInOut(duration: 0.2), value: tempSelectedRating)
                    }
                }
                .padding(.horizontal)

                Spacer()

                VStack(spacing: 12) {
                    Button(action: {
                        selectedRating = tempSelectedRating
                        dismiss()
                    }) {
                        Text("Apply Filter")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }

                    if tempSelectedRating != nil {
                        Button("Clear Filter") {
                            tempSelectedRating = nil
                        }
                        .foregroundColor(.red)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
            .padding(.top)
            .navigationTitle("Filter")
            .onAppear {
                // Sync with external selection
                tempSelectedRating = selectedRating
            }
        }
    }

    @Environment(\.dismiss) var dismiss
}


