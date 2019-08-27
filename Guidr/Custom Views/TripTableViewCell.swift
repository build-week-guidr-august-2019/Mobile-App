//
//  TripTableViewCell.swift
//  Guidr
//
//  Created by Jessie Ann Griffin on 8/22/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import UIKit

class TripTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var shortDescriptionTextView: UITextView!
    @IBOutlet weak var tripImage: UIImageView!
    
    var trip: Trip? 
//    {
//        didSet {
//            updateViews()
//        }
//    }
//
//    private func updateViews() {
//        guard let trip = trip else { return }
//
//        titleLabel.text = trip.title
//        shortDescriptionTextView.text = trip.shortDescription
//        tripImage.image = URL(fileURLWithPath: "trip.image")
//    }
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
