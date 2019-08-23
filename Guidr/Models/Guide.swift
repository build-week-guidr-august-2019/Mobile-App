//
//  Guide.swift
//  Guidr
//
//  Created by Stephanie Bowles on 8/22/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import Foundation

struct Guide:  Codable {
    let id: String
    let name: String
    let age: Int
    let title: String
    let tagline: String
    let yearsAsGuide: Int
    let profilePic: URL
    let coverPic: URL
}

struct Trip: Codable {
    let user_id: Int
    let title: String
    let shortDescription: String
    let isProfessional: Bool
    let type: Int
    let duration: Int
    let distance: Int
    let date: String
    let image: URL 
}
