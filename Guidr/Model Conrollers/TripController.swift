//
//  TripController.swift
//  Guidr
//
//  Created by Jessie Ann Griffin on 8/24/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import Foundation

class TripController {
    
//    private(set) var trips: [Trip] = []
//
//    let userDefaults = UserDefaults.standard
//
//    private var tripListURL: URL? {
//        let fileManager = FileManager.default
//        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
//        return documents.appendingPathComponent("TripList.plist")
//    }
//
//    var professionalTrips: [Trip] {
//        return trips.filter { $0.isProfessional == true }
//    }
//
 
   
//    init() {
////        let userDefault = UserDefaults.standard.bool(forKey: tripListKey)
////        // if it's true it means the app has been run before
////        if userDefault {
////            loadFromPersistentStore() // populates array from saved data
////        }
//        loadFromPersistentStore()
//    }
//
//    private func saveToPersistentStore() {
//        guard let url = tripListURL else { return }
//
//        do {
//            let encoder = PropertyListEncoder()
//            let listData = try encoder.encode(trips)
//            try listData.write(to: url)
//        } catch {
//            print("Error saving trips data: \(error)")
//        }
//    }
//
//    // method to load data from the url created when saving the data - this method also checks if the file exists
//    private func loadFromPersistentStore() {
//        let fileManager = FileManager.default
//
//        do {
//            guard let url = tripListURL, fileManager.fileExists(atPath: url.path) else { return }
//            let data = try Data(contentsOf: url)
//            let decoder = PropertyListDecoder()
//            let decodedList = try decoder.decode([Trip].self, from: data)
//            self.trips = decodedList
//        } catch {
//            print("Error loading/decoding trip list: \(error)")
//        }
//    }
}
