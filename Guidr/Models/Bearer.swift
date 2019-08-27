//
//  Bearer.swift
//  Guidr
//
//  Created by Stephanie Bowles on 8/22/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import Foundation


struct Bearer: Codable {
    let token: String
    let id: Int
    let username: String 
}
