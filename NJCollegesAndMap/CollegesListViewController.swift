//
//  CollegesListViewController.swift
//  NJCollegesAndMap
//
//  Created by Bryan J. Kahl on 10/21/24.
//

import Foundation
import UIKit

class CollegesListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    var colleges: [College] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up table view
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CollegeCell")

        // Load colleges data
        let model = NJCollegeModel()
        model.loadColleges(from: "NJColleges")
        colleges = model.colleges
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCollegeDetailSegue" {
            print("Preparing for segue to detail view...")
            if let detailVC = segue.destination as? CollegeDetailViewController,
               let indexPath = tableView.indexPathForSelectedRow {
                // Pass the selected college to the detail view controller
                detailVC.college = colleges[indexPath.row]
                print("Passing college: \(colleges[indexPath.row].properties.name)")
            }
        }
    }

    // MARK: - TableView DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colleges.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollegeCell", for: indexPath)
        let college = colleges[indexPath.row]
        cell.textLabel?.text = college.properties.name
        cell.textLabel?.numberOfLines = 0
        return cell
    }

    // MARK: - TableView Delegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle cell selection to navigate to detail view
        print("Row \(indexPath.row) selected")
            performSegue(withIdentifier: "showCollegeDetailSegue", sender: self)
    }
}
