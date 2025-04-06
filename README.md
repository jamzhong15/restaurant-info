# RestaurantLocator - iOS Project

A swiftUI app that allows users to search for restaurants by postcode, view them on an interactive map and explore their details.

## Features

- Search restaurants by UK postcode using JustEat API
- Restaurant list showing information for the first 10 results
- Interactive map with restaurant pins
- Filter (currently only by minimum rating)

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
### Usage

1. Open the project in xcode and test in either a simulator or build to an iOS device.
2. Enter a UK postcode in the search bar and hit return
3. Map will show some restaurants in the area and a panel of restaurants can be pulled up to view.
4. Filter currently can be used to limit results by minimum star rating.

## Assumptions

- Only need to show the first 10 restaurants returned with no ranking by distance, popularity, etc.
- Some tags in the cuisines list (e.g. "£8 off", "Low Delivery Fee") are treated as valid cuisines and displayed.
- We are assuming that the Just Eat API is functional, stable and publically accessible without any authentication for any user.

## Improvements
- Add unit and UI tests to ensure core logic and interface behave as expected.
- For restaurants with many cuisine types, the tags can appear cluttered. This could be improved by implementing a “Show More/+” toggle or using a horizontal scroll view to display the tags.
- We could enhance interactivity by highlighting the corresponding restaurant card when a map pin is tapped.
- To improve decoding robustness and clarity, especially as we use more of the API, it may be beneficial to implement custom CodingKeys.
- Additional filtering options, such as delivery availability, price range, or sorting by distance.

