# RestaurantLocator - iOS Project

A swiftUI app that allows users to search for restaurants by postcode, view them on an interactive map and explore their details.

## Features

- Search restaurants by UK postcode using JustEat API
- Restaurant list showing information for the first 10 results
- Interactive map with restaurant pins
- Filter (currently only by minimum rating)

<p align="center">
  <img width="383" alt="justeatapp" src="https://github.com/user-attachments/assets/e1a3116b-756c-43cd-af7c-9ef6020d747a" />
<p>

## Getting started

### Requirements

- macOS (Developed on 15.0.2)
- Xcode (Developed on 16.2)
- iOS 16+
- Swift 5.9+
- Internet

Clone the repository:

```bash
git clone https://github.com/jamzhong15/RestaurantInfo.git
```
```bash
cd RestaurantInfo
```

### Usage

1. Open the `RestaurantInfo.xcodeproj` project in xcode and test in either a simulator or build to an iOS device.
2. Enter a UK postcode in the search bar and hit return
3. Map will show some restaurants in the area and a panel of restaurants can be pulled up to view.
4. Filter currently can be used to limit results by minimum star rating.

## Testing

- Unit tests written using the Swift `Testing` framework (Swift 5.9)
- Tests cover postcode validation and restaurant filtering logic
- Can be run using **⌘ + U** in Xcode or by clicking the ▶️ icon in test methods

## Architecture

The app follows a lightweight MVVM architecture:

- **Model**: Codable structs that match the Just Eat API response (`Restaurant`)
- **ViewModel**: `RestaurantViewModel` handles network requests, state, and business logic (e.g. filtering)
- **View**: SwiftUI views (`ContentView`, `RestaurantRowView`, etc.)

## Assumptions

- Only need to show the first 10 restaurants returned with no ranking by distance, popularity, etc.
- Some tags in the cuisines list (e.g. "£8 off", "Low Delivery Fee") are treated as valid cuisines and displayed.
- We are assuming that the Just Eat API is functional, stable and has a consistent response body.

## Future Improvements
- Add more unit and UI tests to ensure core logic and interface behave as expected.
- For restaurants with many cuisine types, the tags can appear cluttered. This could be improved by implementing a “Show More/+” toggle or using a horizontal scroll view to display the tags.
- Enhance interactivity by highlighting restaurant cards when tapping on map pin
- To improve decoding robustness and clarity, especially as we use more of the API, it may be beneficial to implement custom CodingKeys.
- Move the networking logic into a NetworkManager to abstract away from the View Controller.
- Expand filtering (e.g. delivery status, cuisine, price range)

