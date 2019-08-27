//
//  Guide.swift
//  Guidr
//
//  Created by Stephanie Bowles on 8/22/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import Foundation

struct Guide:  Codable{
    var id: Int?
    let name: String
    let age: Int
    let title: String
    let tagline: String?
    let yearsAsGuide: Int
    
    init(id: Int, name: String, age: Int, title: String, tagline: String, yearsAsGuide: Int) {
        self.id = id
        self.name = name
        self.age = age
        self.title = title
        self.tagline = tagline
        self.yearsAsGuide = yearsAsGuide
    }
//    let profilePic: URL
//    let coverPic: URL
    
//    enum CodingKeys: String, CodingKey {
//        case id = "user_id"
//    }
//
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = try values.decode(Int.self, forKey: .id)
//        self.name = name
//        self.age = age
//        self.title = title
//        self.tagline = tagline
//        self.yearsAsGuide = yearsAsGuide
//
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(id, forKey: .id)
//}

}
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
    
    init(user_id: Int, title: String, shortDescription: String, isProfessional: Bool, type: Int, duration: Int, distance: Int, date: String) {
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
