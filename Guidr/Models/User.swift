//
//  User.swift
//  Guidr
//
//  Created by Stephanie Bowles on 8/22/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import Foundation

struct User: Codable {
//    , id: Int? = nil
    init(username: String, password: String) {
        self.username = username
        self.password = password 
    }
    let username: String
    let password: String 
}
