//
//  Trip.swift
//  Guidr
//
//  Created by Stephanie Bowles on 8/29/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import Foundation

struct Trip: Codable, Equatable {
    var user_id: Int
    let title: String
    let shortDescription: String?
    let isProfessional: Bool?
    let type: Int
    let duration: Int
    let distance: Int?
    let date: String
    //    let image: URL
    
    init( user_id: Int, title: String, shortDescription: String?, isProfessional: Bool?, type: Int, duration: Int, distance: Int?, date: String) {
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