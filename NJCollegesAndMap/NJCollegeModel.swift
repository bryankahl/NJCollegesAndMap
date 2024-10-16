//
//  NJCollegeModel.swift
//  NJCollegesAndMap
//
//  Created by Bryan J. Kahl on 10/16/24.
//

import Foundation

// Struct to represent the coordinates in the geometry field
struct Geometry: Codable {
    let type: String
    let coordinates: [Double]
}

// Struct to represent the properties field
struct CollegeProperties: Codable {
    let fid: Int
    let objectID: Int
    let name: String
    let municipali: String
    let county: String
    let parcel: String
    let address: String
    let address2: String
    let city: String
    let state: String
    let zip: String
    let phone: String
    let degree: String
    let doctoral: String

    enum CodingKeys: String, CodingKey {
        case fid = "FID"
        case objectID = "OBJECTID"
        case name = "Name"
        case municipali = "Municipali"
        case county = "County"
        case parcel = "Parcel"
        case address = "ADDRESS"
        case address2 = "ADDRESS2"
        case city = "CITY"
        case state = "STATE"
        case zip = "ZIP"
        case phone = "PHONE"
        case degree = "DEGREE"
        case doctoral = "DOCTORAL"
    }
}

// Struct to represent the overall college data
struct College: Codable {
    let id: Int
    let geometry: Geometry
    let properties: CollegeProperties

    enum CodingKeys: String, CodingKey {
        case id
        case geometry
        case properties
    }
}

// Class to handle the model's data
class NJCollegeModel {
    var colleges: [College] = []

    // Load and decode the JSON data
    func loadColleges(from fileName: String) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                colleges = try decoder.decode([College].self, from: data)
                print("Colleges data loaded successfully.")
            } catch {
                print("Error loading JSON data: \(error)")
            }
        } else {
            print("JSON file not found.")
        }
    }

    // Print all colleges to the console for testing
    func printAllColleges() {
        for college in colleges {
            print("College: \(college.properties.name), Address: \(college.properties.address), City: \(college.properties.city), State: \(college.properties.state), Coordinates: \(college.geometry.coordinates)")
        }
    }
}

