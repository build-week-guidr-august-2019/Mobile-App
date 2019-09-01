//
//  PortfolioViewController.swift
//  Guidr
//
//  Created by Jessie Ann Griffin on 8/24/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import UIKit

class PortfolioViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var tripImageView: UIImageView!
    @IBOutlet weak var descriptionTextField: UITextView!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var durationTextField: UITextField!
    @IBOutlet weak var difficultyTextField: UITextField!
    @IBOutlet weak var tripTitleLabel: UILabel!
    
    //var tripController: TripController?
    var trip: Trip? {
        didSet {
            DispatchQueue.main.async {
                self.updateViews()
            }
        }
    }
    
    var guideController: GuideController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()

    }
    
    func updateViews() {
        
        guard let trip = trip else {return }
        tripTitleLabel.text = trip.title
        descriptionTextField.text = trip.shortDescription
        dateTextField.text =  "Date of Trip: \(String(describing: trip.date))" // need formatting for the date

        durationTextField.text = "Duration of Trip: \(String(describing: trip.duration)) day(s)"
//        difficultyTextField.text = "Level of Difficulty: \(String(describing: trip.type))"
//
        //        guard let urlForImage = URL(string: String(describing: trip?.image)) else { return }
        //        let session = URLSession(configuration: .default)
        //
        //        let getImageFromUrl = session.dataTask(with: urlForImage) { ( data, response, error )
        //            if let e = error {
        //                print("Some error occurred: \(e)")
        //            }
        //
        //            if let imageData = data {
        //                let image = UIImage(data: imageData)
        //            } else {
        //                print("no image found")
        //            }
        //        }
        
        // Need unwrapping for each item
        
        //tripImageView.image = UIImage(trip?.image)
       
    }
    
//    func loadTrip(){
//        if trip == nil {
//            guideController?.fetchSingleTrip(trip: Trip, completion: { (error) in
//                if let error = error {
//                    NSLog("Error loading Trip: \(error)")
//                    return
//                }
//
//                DispatchQueue.main.async {
//                    self.trip = self.guideController?.trips
//
//                }
//            })
//        }
//
//
//    }
    @IBAction func moreOptionsPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
        guard let trip = trip else { return }
        let alertController = UIAlertController(title: "More Options...", message: nil, preferredStyle: .alert)
        
        // Creates Options (actions) that will be shown in the alert
        let editAction = UIAlertAction(title: "Edit", style: .default,
                        handler: { action in self.performSegue(withIdentifier: "EditTripModalSegue", sender: self) })
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive,
                                         handler: {action in self.guideController?.deleteTrip(trip: trip, completion: <#(NetworkError?) -> ()#>)})
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        // Adds actions to the list of options
        alertController.addAction(editAction)
        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "EditTripModalSegue" {
//            if let editTripVC = segue.destination as? EditTripViewController {
//                //editTripVC.trip = trip
//            }
//        }
//    }
    

  

}
