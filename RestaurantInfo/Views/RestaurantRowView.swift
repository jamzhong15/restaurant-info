import SwiftUI

struct RestaurantRowView: View {
    let restaurant: Restaurant

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            VStack {
                Spacer()
                
                if let logoUrl = restaurant.logoUrl, let url = URL(string: logoUrl) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 50, height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                } else {
                    Image(systemName: "fork.knife")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.orange)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                
                Spacer()
            }
            
            Divider()
                .frame(width: 1)
                .background(Color.gray.opacity(0.2))
                .padding(.vertical, 8)

            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(restaurant.name)
                        .font(.headline)
                        .bold()

                    Spacer()

                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                            .font(.caption)

                        Text("\(restaurant.rating.starRating, specifier: "%.1f")")
                            .font(.caption)
                            .fontWeight(.medium)
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.orange.opacity(0.1))
                    .foregroundColor(.orange)
                    .clipShape(Capsule())
                }

                Text(restaurant.cuisines.map { $0.name }.joined(separator: " • "))
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                HStack(spacing: 4) {
                    Image(systemName: "mappin")
                        .foregroundColor(.orange)
                        .font(.footnote)
                    Text("\(restaurant.address.firstLine), \(restaurant.address.city)")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }

            Spacer()
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 2)
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

