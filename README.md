# NJ Colleges App

This is an iOS application that shows information about colleges in New Jersey. The user can look at a summary view, a list of colleges, and see the locations of those colleges on a map. The user can see more detailed information about each college, including the name, address, and location on an interactive map. 

## Key Features

- **Summary View**: Shows the total amount of colleges in New Jersey, and splits them up into 3 separate sections: North, Central, and South Jersey. The counts of how many colleges in each section is displayed. 
- **List View**: Shows the list of all the colleges in New Jersey
- **Map View**: Uses MapKit to show the locations of all the colleges in New Jersey with interactive map markers. 
- **Detail View**: Shows detailed view when user clicks on a college from the List View or Map View, and shows the name, address, and map locaiton of the college. 

## Details

- **Platform**: iOS
- **Language**: Swift
- **Frameworks**:
  - **UIKit**: For the user interface elements that are used including labels, table views, and view controllers.
  - **MapKit**: To display maps and annotations.
  - **CoreLocation**: For utilizing the geographic coordinates.
- **Data**: Uses the JSON file (`NJColleges.json`) to store and load data about the colleges, including name, address, county, and coordinates.

## Project Structure

- **Model**: 
  - `College` struct conforms to `Codable` for easy parsing of JSON data.
  - `NJCollegeModel` loads the JSON file and manages the college data. 
- **View Controllers**:
  - `SummaryViewController`: Displays the summary and count of the colleges. 
  - `CollegesListViewController`: Displays the list of all the colleges in a Table View. 
  - `MapViewController`: Shows where the college is located
  - `CollegeDetailViewController`: Shows some details of the selected college. 
- **Assets**: Contains the app logo.

- ## Usage
- To view the app, use the files provided and open in Xcode!
