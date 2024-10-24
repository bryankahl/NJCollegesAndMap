//
//  CollegeDetailViewController.swift
//  NJCollegesAndMap
//
//  Created by Bryan J. Kahl on 10/21/24.
//

import Foundation
import UIKit
import MapKit

class CollegeDetailViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    var college: College?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the detail view with the college information
        if let college = college {
            nameLabel.text = college.properties.name
            addressLabel.text = "\(college.properties.address), \(college.properties.city), \(college.properties.state) \(college.properties.zip)"
            
            let coordinate = CLLocationCoordinate2D(
                latitude: college.geometry.coordinates[1],
                longitude: college.geometry.coordinates[0]
            )
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = college.properties.name
            
            mapView.addAnnotation(annotation)
            
            let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 5000, longitudinalMeters: 5000)
            mapView.setRegion(region, animated: true)
        }
    }
}
