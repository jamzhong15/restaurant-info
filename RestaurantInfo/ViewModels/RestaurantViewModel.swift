//
//  RestaurantViewModel.swift
//  RestaurantInfo
//
//  Created by James Zhong on 01/04/2025.
//

import Foundation

struct APIResponse: Codable {
    let restaurants: [Restaurant]
}

class RestaurantViewModel: ObservableObject {
    @Published var restaurants: [Restaurant] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var minimumRating: Double? = nil
    
    var filteredRestaurants: [Restaurant] {
        guard let minRating = minimumRating else {
            return restaurants
        }

        return restaurants.filter { $0.rating.starRating >= minRating }
    }

    func fetchRestaurants(for postcode: String) {
        guard let encodedPostcode = postcode.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            self.errorMessage = "Invalid postcode format."
            return
        }

        // Build the API URL
        let urlString = "https://uk.api.just-eat.io/discovery/uk/restaurants/enriched/bypostcode/\(encodedPostcode)"

        guard let url = URL(string: urlString) else {
            self.errorMessage = "Failed to create URL."
            return
        }

        isLoading = true
        errorMessage = nil

        // Perform network call
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                self.isLoading = false
            }

            if let error = error {
                DispatchQueue.main.async {
                    self.errorMessage = "Network error: \(error.localizedDescription)"
                }
                return
            }

            guard let data = data else {
                DispatchQueue.main.async {
                    self.errorMessage = "No data returned from server."
                }
                return
            }

            do {
                let decoded = try JSONDecoder().decode(APIResponse.self, from: data)
                DispatchQueue.main.async {
                    self.restaurants = decoded.restaurants
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = "Failed to decode response: \(error.localizedDescription)"
                }
            }
        }.resume()
    }
    
    func isValidPostcode(_ postcode: String) -> Bool {
        let cleaned = postcode.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        let regex = try! NSRegularExpression(pattern: #"^[A-Z]{1,2}[0-9R][0-9A-Z]?\s?[0-9][A-Z]{2}$"#)
        let range = NSRange(location: 0, length: cleaned.utf16.count)
        return regex.firstMatch(in: cleaned, options: [], range: range) != nil
    }
    
}
