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
    var guide: [Guide] = []
    var trip: [Trip]  = []
    
    var bearer: Bearer?
   
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
//                self.bearer.token = loggedIn
            } catch {
                NSLog("error decoding bearer object: \(error)")
                completion(.noDecode)
                return
                
            }
            completion(nil)
        } .resume()
 
    }
    
    func putUser(username: String, name: String, age: Int, title: String, yearsAsGuide: Int, completion: @escaping (NetworkError?) -> ()) {
        
        //how to initialize this?
        let newUser = User(username: username)
        let newGuide = Guide(name: name, age: age, title: title, yearsAsGuide: yearsAsGuide)
       
        
        guard let bearer = self.bearer else {
            completion(.noAuth)
            return
        }
        
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
            
            self.guide.append(newGuide)
            
            //Do I need to do decoder again for the new token?
            guard let data = data else {
                completion(.badData)
                return
            }
            let decoder = JSONDecoder()
            
            do {
             
                self.bearer = try decoder.decode(Bearer.self, from: data)
                
            } catch {
                NSLog("error decoding bearer object: \(error)")
                completion(.noDecode)
                return
                
            }
            completion(nil)
            } .resume()
        
    }
    
    func createTrip(user_id: Int, title: String, type: Int, duration: Int, date: String, completion: @escaping (NetworkError?) -> ()) {
        
        let newTrip = Trip(user_id: user_id, title: title, type: type, duration: duration, date: date)
        guard let bearer = self.bearer else {
            completion(.noAuth) //SLB
            return
        }
        let postTripURL = baseURL.appendingPathComponent("trip")
        var request = URLRequest(url: postTripURL)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(bearer.token)", forHTTPHeaderField: "Authorization")
        
        
    
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
            self.trip.append(newTrip)
            completion(nil)
            } .resume()
    }
        
}
