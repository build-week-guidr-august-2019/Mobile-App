//
//  Trip.swift
//  Guidr
//
//  Created by Stephanie Bowles on 8/29/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import Foundation


struct TripResults: Codable {
    let trips: [Trip]
}
struct Trip: Codable, Equatable {
    var id: Int?
    var user_id: Int?
    let title: String
    let shortDescription: String?   //haven't added long description
    let isProfessional: Bool?
    let type: Int?
    let duration: Int?
    let distance: Int?
    let date: String?
    //    let image: URL
    
    init( id: Int?, user_id: Int?, title: String, shortDescription: String?, isProfessional: Bool?, type: Int?, duration: Int?, distance: Int?, date: String?) {
        self.id = id
        self.user_id = user_id
        self.title = title
        self.shortDescription = shortDescription
        self.isProfessional = isProfessional
        self.type = type
        self.duration = duration
        self.distance = distance
        self.date = date
        
    }
}
