//
//  SummaryViewController.swift
//  NJCollegesAndMap
//
//  Created by Bryan J. Kahl on 10/21/24.
//

import Foundation
import UIKit

class SummaryViewController: UIViewController {
    @IBOutlet weak var totalCollegesLabel: UILabel!
    @IBOutlet weak var northJerseyLabel: UILabel!
    @IBOutlet weak var centralJerseyLabel: UILabel!
    @IBOutlet weak var southJerseyLabel: UILabel!
    
    var colleges: [College] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load colleges data
        let model = NJCollegeModel()
        model.loadColleges(from: "NJColleges")
        colleges = model.colleges

        // Calculate/display summary data
        displaySummary()
    }
    
    func displaySummary() {
            let totalColleges = colleges.count
            
            // Define latitude ranges
            let northJerseyColleges = colleges.filter { $0.geometry.coordinates[1] > 40.47368 }.count
            let centralJerseyColleges = colleges.filter { $0.geometry.coordinates[1] <= 40.47368 && $0.geometry.coordinates[1] >= 39.95219 }.count
            let southJerseyColleges = colleges.filter { $0.geometry.coordinates[1] < 39.95219 }.count

            // Update labels with counts
            totalCollegesLabel.text = "Total Colleges: \(totalColleges)"
            northJerseyLabel.text = "North Jersey Colleges: \(northJerseyColleges)"
            centralJerseyLabel.text = "Central Jersey Colleges: \(centralJerseyColleges)"
            southJerseyLabel.text = "South Jersey Colleges: \(southJerseyColleges)"
        }
}
