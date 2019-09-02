//
//  GuideController.swift
//  Guidr
//
//  Created by Stephanie Bowles on 8/22/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import Foundation


enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}

enum NetworkError: Error {
    case noAuth
    case badAuth
    case otherError
    case badData
    case noDecode
}

class GuideController {
    var guide: Guide?
    var trips: [Trip]  = []
    
    
    var bearer: Bearer? {
        didSet{
            guard let bearer = bearer else {return}
            UserDefaults.standard.set("\(bearer.token)", forKey: "Bearer")
            print("token set")
            
//            return UserDefaults.standard.string(forKey: "Bearer") ?? ""
        
        }
    }
    
    private let baseURL = URL(string: "https://lambda-guidr.herokuapp.com/api")!
    
    
    func signUp(with user: User, completion: @escaping (Error?) -> ()) {
        let signUpURL = baseURL.appendingPathComponent("auth/register")
        
        var request = URLRequest(url: signUpURL)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let jsonEnconder = JSONEncoder()
        do {
            let jsonData = try jsonEnconder.encode(user)
            request.httpBody = jsonData
        } catch {
            print("Error encoding user object: \(error)")
            completion(error)
            return
        }
        URLSession.shared.dataTask(with: request) { _, response, error in
            if let response = response as? HTTPURLResponse,
                response.statusCode != 201 {
                //or 200?
                completion(NSError(domain:"", code: response.statusCode, userInfo: nil))
                return
            }
            if let error = error {
                completion(error)
                return
            }
            completion(nil)
            } .resume()
    }
    
    // log in
    
    func logIn(with user: User, completion: @escaping (NetworkError?) -> ()) {
        let logInURL = baseURL.appendingPathComponent("auth/login")
        var request = URLRequest(url: logInURL)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(user)
            request.httpBody = jsonData
        } catch {
            NSLog("Error encoding user object: \(error)")
            completion(.noAuth)
        }
        
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 {
                //                completion(NSError(domain: "", code: response.statusCode, userInfo: nil))
                completion(.badAuth)
                return
            }
            if let _ = error {
                completion(.otherError)
                return
            }
            guard let data = data else {
                completion(.badData)
                return
            }
            let decoder = JSONDecoder()
            
            do {
                self.bearer = try decoder.decode(Bearer.self, from: data)
                //USER DEFAULT
//                guard let bearer = self.bearer else {return}
//                let userDefaults = UserDefaults.standard
//                userDefaults.set("\(bearer.token))", forKey: "Bearer")
                
                //    May need this later?            let savedBearer = userDefaults.string(forKey: "Bearer") as? [String] ?? [String]()
            } catch {
                NSLog("error decoding bearer object: \(error)")
                completion(.noDecode)
                return
                
            }
            completion(nil)
            } .resume()
        
    }
    
    func putUser(name: String, age: Int, tagline: String, yearsAsGuide: Int, completion: @escaping (NetworkError?) -> ()) {
        
        
        
        guard let bearer = self.bearer else {
            completion(.noAuth)
            return
        }
        
        let newGuide = Guide(username: bearer.username, id: bearer.id, name: name, age: age, title: nil, tagline: tagline, yearsAsGuide: yearsAsGuide)
        
        let putUserURL = baseURL.appendingPathComponent("auth/update")
        var request = URLRequest(url: putUserURL)
        request.httpMethod = HTTPMethod.put.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("\(bearer.token)", forHTTPHeaderField: "Authorization")
        
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(newGuide)
            request.httpBody = jsonData
        } catch {
            NSLog("Error encoding guide: \(error)")
            completion(.otherError)
        }
        
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 {
                completion(.badAuth)
                return
            }
            if let _ = error {
                completion(.otherError)
                return
            }
            
            self.guide = newGuide

            guard let data = data else {
                completion(.badData)
                return
            }
            let decoder = JSONDecoder()
            
            do {
                
                self.bearer = try decoder.decode(Bearer.self, from: data)
//                USER DEFAULts again for update:
//                guard let bearer = self.bearer else {return}
//                let userDefaults = UserDefaults.standard
//                userDefaults.set("\(bearer.token))", forKey: "Bearer")
                
            } catch {
                NSLog("error decoding bearer object: \(error)")
                completion(.noDecode)
                return
                
            }
            completion(nil)
            } .resume()
        
    }
    
    func createTrip(title: String, shortDescription: String, duration: Int, date: String, completion: @escaping (NetworkError?) -> ()) {
        
        guard let bearer = self.bearer else {
            completion(.noAuth)  
            return
        }
        let newTrip = Trip(id: nil, user_id: bearer.id, title: title, shortDescription: shortDescription, isProfessional: nil, type: 1, duration: duration, distance: nil, date: date)
        
        let postTripURL = baseURL.appendingPathComponent("trip")
        var request = URLRequest(url: postTripURL)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("\(bearer.token)", forHTTPHeaderField: "Authorization")
        
        
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(newTrip)
            request.httpBody = jsonData
        } catch {
            NSLog("Error encoding user object: \(error)")
            completion(.otherError)
        }
        
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            if let response = response as? HTTPURLResponse,
                response.statusCode != 201 {
                completion(.badAuth)
                return
            }
            if let _ = error {
                completion(.otherError)
                return
            }
            
            guard let data = data else {
                completion(.badData)
                return
                
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedTrip = try decoder.decode(Trip.self, from: data)
                self.trips.append(decodedTrip)
                
            } catch {
                NSLog("Error decoding single Trip: \(error)")
                completion(.noDecode)
                return
            }
            
            
            completion(nil)
            } .resume()
    }
    
    func fetchGuide(completion: @escaping (NetworkError?) -> Void) {
        
        guard let bearer = self.bearer else {
            completion(.noAuth)
            return
        }
        let fetchURL = baseURL.appendingPathComponent("user")
        
        var request = URLRequest(url: fetchURL)
        request.httpMethod = HTTPMethod.get.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("\(bearer.token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 {
                completion(.badAuth)
                return
            }
            if let error = error {
                NSLog("Error getting guide \(error)")
                completion(.otherError)
                return
            }
            guard let data = data else {
                NSLog("No data returned" )
                completion(.badData)
                return
            }
            let decoder = JSONDecoder()
            
            
            do {
                self.guide = try decoder.decode(Guide.self, from: data)
                completion(nil)
            } catch {
                NSLog("Error decoding guide: \(error)")
                completion(.noDecode)
                return
            }
            } .resume()
    }
    func fetchAllTrips(completion: @escaping (NetworkError?) -> Void) {
        
        guard let bearer = self.bearer else {
            completion(.noAuth)
            return
        }
        let fetchURL = baseURL.appendingPathComponent("user/trips")
        
        var request = URLRequest(url: fetchURL)
        request.httpMethod = HTTPMethod.get.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("\(bearer.token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 {
                completion(.badAuth)
                return
            }
            if let error = error {
                NSLog("Error getting trips \(error)")
                completion(.otherError)
                return
            }
            guard let data = data else {
                NSLog("No data returned" )
                completion(.badData)
                return
            }
            let decoder = JSONDecoder()
            
            
            do {
                
                let tripResults = try decoder.decode(TripResults.self, from: data)
                self.trips = tripResults.trips
                completion(nil)
            } catch {
                NSLog("Error decoding trips: \(error)")
                completion(.noDecode)
                return
            }
            } .resume()
    }
    
    func fetchSingleTrip(trip: Trip, completion: @escaping (NetworkError?) -> Void) {
   
        guard let bearer = self.bearer else {
            completion(.noAuth)
            return
        }
        guard let id = trip.id else {
            print("Trip Id failed")
            completion(.otherError)
            return}
        
        let getTripURL = baseURL.appendingPathComponent("trip/\(id)")
      
        
        var request = URLRequest(url: getTripURL)
        request.httpMethod = HTTPMethod.get.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("\(bearer.token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 {
                completion(.badAuth)
                return
            }
            if let error = error {
                NSLog("Error getting trip \(error)")
                completion(.otherError)
                return
            }
            guard let data = data else {
                NSLog("No data returned" )
                completion(.badData)
                return
            }
            let decoder = JSONDecoder()
            
            
            do {
                let decodedTrip = try decoder.decode(Trip.self, from: data)
                guard let tripIndex = self.trips.firstIndex(of: trip) else {throw NetworkError.otherError}
                self.trips[tripIndex] = decodedTrip
                completion(nil)
            } catch {
                NSLog("Error decoding guide: \(error)")
                completion(.noDecode)
                return
            }
            } .resume()
    }
    
    func putTrip(trip: Trip, title: String, shortDescription: String, duration: Int, date: String, completion: @escaping (NetworkError?) -> ()) {
        
        guard let bearer = self.bearer else {
            completion(.noAuth)
            return
        }
        guard let id = trip.id else {
            print("Trip Id failed")
            completion(.otherError)
            return}
        
        let putTripURL = baseURL.appendingPathComponent("trip/\(id)")
        let updatedTrip = Trip(id: id, user_id: bearer.id, title: title, shortDescription: shortDescription, isProfessional: nil, type: 1, duration: duration, distance: nil, date: date)
  
        
        var request = URLRequest(url: putTripURL)
        request.httpMethod = HTTPMethod.put.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("\(bearer.token)", forHTTPHeaderField: "Authorization")
        
        
        
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(updatedTrip)
            request.httpBody = jsonData
        } catch {
            NSLog("Error encoding user object: \(error)")
            completion(.otherError)
        }
        
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 {
                completion(.badAuth)
                return
            }
            if let _ = error {
                completion(.otherError)
                return
            }
           
            
           let decoder = JSONDecoder()
            guard let data = data else {
                completion(.badData)
                return}
            do {
                let decodedTrip = try decoder.decode(Trip.self, from: data)
                guard let tripIndex = self.trips.firstIndex(of: trip) else {throw NetworkError.otherError}
                self.trips[tripIndex] = decodedTrip
            }  catch {
                NSLog("Error updating trip: \(error)")
                completion(.otherError)
            }
            
            
            completion(nil)
            } .resume()
    }
    
    func deleteTrip(trip: Trip, completion: @escaping (NetworkError?) -> ()) {
        
        guard let bearer = self.bearer else {
            completion(.noAuth)
            return
        }
     
        guard let id = trip.id else {
            print("Trip Id failed")
            completion(.otherError)
            return}
        
        let deleteTripURL = baseURL.appendingPathComponent("trip/\(id)")
        var request = URLRequest(url: deleteTripURL)
        request.httpMethod = HTTPMethod.delete.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("\(bearer.token)", forHTTPHeaderField: "Authorization")


        URLSession.shared.dataTask(with: request) {(data, response, error) in
            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 {
                completion(.badAuth)
                return
            }
            if let _ = error {
                completion(.otherError)
                return
            }

//            guard let data = data else {
//                NSLog("No data returned" )
//                completion(.badData)
//                return
//            }
            
//            let decoder = JSONDecoder()
           
            do {
        
                guard let tripIndex = self.trips.firstIndex(of: trip) else {throw NetworkError.otherError}
                self.trips.remove(at: tripIndex)
            }  catch {
                NSLog("Error updating trip: \(error)")
                completion(.otherError)
            }
            
         

            completion(nil)
            } .resume()
    }
    
}
