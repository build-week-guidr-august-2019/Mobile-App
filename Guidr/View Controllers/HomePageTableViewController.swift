//
//  HomePageTableViewController.swift
//  Guidr
//
//  Created by Stephanie Bowles on 8/22/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import UIKit

class HomePageTableViewController: UITableViewController {

    let guideController = GuideController()
    //let tripController = TripController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
     
        if guideController.bearer != nil {
//
//        let userDefaults = UserDefaults.standard
//
//        let savedData = userDefaults.string(forKey: "Bearer")
////        guard let bearer = guideController.bearer else {return}
//        if savedData != nil {
            guideController.fetchAllTrips { (result) in
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
//            }
        } else {
            performSegue(withIdentifier: "ToLanding", sender: nil)
        }
       
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return guideController.trips.count
    }

//    @IBAction func addTripButtonPressed(_ sender: UIBarButtonItem) {
//    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TripCell", for: indexPath) as? TripTableViewCell else { return UITableViewCell() }
       cell.titleLabel.text = guideController.trips[indexPath.row].title
       cell.shortDescriptionTextView.text = guideController.trips[indexPath.row].shortDescription
       return cell 
    }


    

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            guideController.deleteTrip(trip: guideController.trips[indexPath.row]) { (error) in
                DispatchQueue.main.async {
                     tableView.deleteRows(at: [indexPath], with: .fade)
                    self.tableView.reloadData()
                }
            }
        }
    }
  
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ToLanding" {
            guard let landingVC = segue.destination as? LandingPageNavViewController else {return}
            landingVC.guideController = guideController
        } else if segue.identifier == "ModalProfileSegue" {
            guard let portfolioVC = segue.destination as? ProfileViewController else {return}
                portfolioVC.guideController = guideController
        } else if segue.identifier == "ShowCreateTripSegue" {
            guard let createVC = segue.destination as? CreateTripViewController else {return}
                createVC.guideController = guideController
        } else if segue.identifier == "ShowPortfolioSegue" {
            guard let showVC = segue.destination as? PortfolioViewController else {return}
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            showVC.trip = guideController.trips[indexPath.row]
            showVC.guideController = guideController
        }
    }
     
  

 
}
