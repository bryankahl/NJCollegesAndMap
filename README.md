# NJ Colleges App

This is an iOS application that shows information about colleges in New Jersey. The user can look at a summary view, a list of colleges, and see the locations of those colleges on a map. The user can see more detailed information about each college, including the name, address, and location on an interactive map. 

## Key Features

- **Summary View**: Shows the total amount of colleges in New Jersey, and splits them up into 3 separate sections: North, Central, and South Jersey. The counts of how many colleges in each section is displayed. 
- **List View**: Shows the list of all the colleges in New Jersey
- **Map View**: Uses MapKit to show the locations of all the colleges in New Jersey with interactive map markers. 
- **Detail View**: Shows detailed view when user clicks on a college from the List View or Map View, and shows the name, address, and map locaiton of the college. 

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
