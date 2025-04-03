import SwiftUI

struct RestaurantRowView: View {
    let restaurant: Restaurant

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            VStack {
                Spacer()
                Image(systemName: "fork.knife") // Replace with logo later if needed
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.orange)
                    .padding(.top, 20)
                Spacer()
            }

            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(restaurant.name)
                        .font(.title3)
                        .bold()

                    Spacer()

                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("\(restaurant.rating.starRating, specifier: "%.1f")")
                            .font(.subheadline)
                    }
                }

                Text(restaurant.cuisines.map { $0.name }.joined(separator: ", "))
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                HStack(spacing: 4) {
                    Image(systemName: "mappin")
                        .foregroundColor(.red)
                    Text("\(restaurant.address.firstLine), \(restaurant.address.city)")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }

            Spacer()
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 2)
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}
