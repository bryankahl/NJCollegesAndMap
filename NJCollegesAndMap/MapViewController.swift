//
//  MapViewController.swift
//  NJCollegesAndMap
//
//  Created by Bryan J. Kahl on 10/21/24.
//

import Foundation
import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!
    
    var colleges: [College] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up map view
        mapView.delegate = self
        mapView.showsUserLocation = true

        // Load colleges data
        let model = NJCollegeModel()
        model.loadColleges(from: "NJColleges")
        colleges = model.colleges
        
        // Add annotations for each college
        addCollegeAnnotations()
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if let annotation = view.annotation as? MKPointAnnotation {
            // Find the selected college based on the annotation's title
            if let selectedCollege = colleges.first(where: { $0.properties.name == annotation.title }) {
                performSegue(withIdentifier: "showCollegeDetailFromMapSegue", sender: selectedCollege)
            }
        }
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let identifier = "CollegeAnnotation"
            
            // Skip customizing the user's location pin (the blue dot)
            if annotation is MKUserLocation {
                return nil
            }
            
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView

            if annotationView == nil {
                annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = true
                annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            } else {
                annotationView?.annotation = annotation
            }

            return annotationView
        }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCollegeDetailFromMapSegue" {
            if let detailVC = segue.destination as? CollegeDetailViewController,
               let selectedCollege = sender as? College {
                detailVC.college = selectedCollege
            }
        }
    }


    func addCollegeAnnotations() {
        for college in colleges {
            let annotation = MKPointAnnotation()
            annotation.title = college.properties.name
            annotation.coordinate = CLLocationCoordinate2D(
                latitude: college.geometry.coordinates[1],
                longitude: college.geometry.coordinates[0]
            )
            mapView.addAnnotation(annotation)
            
            
        }
        
        // Zoom map to show all annotations
        if let firstAnnotation = mapView.annotations.first {
            let region = MKCoordinateRegion(center: firstAnnotation.coordinate, latitudinalMeters: 50000, longitudinalMeters: 50000)
            mapView.setRegion(region, animated: true)
        }
    }
}
