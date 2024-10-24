# NJ Colleges App

## Overview

**NJ Colleges** is an iOS application that provides information about colleges across New Jersey. The app allows users to view a summary of colleges, browse a list of colleges, and explore their locations on an interactive map. Users can also view detailed information about each college, including its name, address, and location.

## Features

- **Summary View**: Displays the total number of colleges and counts of colleges in North, Central, and South Jersey.
- **List View**: Shows a list of colleges, displaying the name and county for each.
- **Map View**: Uses MapKit to show the locations of colleges across New Jersey with interactive map pins.
- **Detail View**: Provides detailed information about a selected college, including its address and a map view of the college's location.

## How to Use

1. **Summary Tab**: Get an overview of the number of colleges in different regions of New Jersey.
2. **List Tab**: Browse through the list of colleges. Tap on a college to view detailed information.
3. **Map Tab**: Explore the locations of colleges on an interactive map. Tap on a pin to see the college's name and navigate to its detail view.
4. **Detail View**: View the full details of a selected college, including its address and a map showing its precise location.

## Technical Details

- **Platform**: iOS
- **Language**: Swift
- **Frameworks**:
  - **UIKit**: For user interface elements like labels, table views, and view controllers.
  - **MapKit**: For displaying maps and adding annotations.
  - **CoreLocation**: For working with geographic coordinates.
- **Data**: Uses a JSON file (`NJColleges.json`) to store and load data about colleges, such as their name, address, county, and geographical coordinates.

## Project Structure

- **Model**: 
  - `College` struct conforms to `Codable` for easy parsing of JSON data.
  - `NJCollegeModel` loads and manages the college data from the JSON file.
- **View Controllers**:
  - `SummaryViewController`: Displays the summary of colleges.
  - `CollegesListViewController`: Displays a list of colleges in a table view.
  - `MapViewController`: Shows college locations on a map.
  - `CollegeDetailViewController`: Displays detailed information about a selected college.
- **Assets**: Includes app icons and images used within the app.

## Installation

To run the NJ Colleges app:

1. Clone the repository:
   ```bash
   git clone [repository-url]
