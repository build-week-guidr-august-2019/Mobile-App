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
                response.statusCode != 200 {
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
            if let error = error {
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
            } catch {
                NSLog("error decoding bearer object: \(error)")
                completion(.noDecode)
                return
                
            }
            completion(nil)
        } .resume()
 
    }
}
