//
//  APIManager.swift
//  Tinder
//
//  Created by Nirbhay Singh on 17/11/20.
//  Copyright © 2020 Nirbhay Singh. All rights reserved.
//

import UIKit

final class APIManager: APIClient {
    
    
    
    //
    // MARK: - Constants
    //
    let defaultSession = URLSession(configuration: .default)
    var session: URLSession = URLSession(configuration: .default)
    //
    // MARK: - Type Alias
    //
    typealias LoginResult = (BaseResponse<User>?,String?)->Void
    
    //
    // MARK: - Internal Methods
    //
    /**
     Perform login
     */
    func performLogin(user:BaseResponse<User>, completion: @escaping LoginResult) {
        
        let urlString = BaseURL.getEndURL(function: .login)
        guard let url = URL(string: urlString) else {
            return
        }
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        do {
            let encoder = JSONEncoder()
            if let jsonData = try? encoder.encode(user) {
                request.httpBody = jsonData
            }
            
        }



        //TODO:- To call generic method and perfom the fetch operation
        return
        let _ = session.dataTask(with: request) { (data,response,error) in
            guard let data = data else { return }
            do {
                
                let decoder = JSONDecoder()
                let userData = try decoder.decode(BaseResponse<User>.self as! User.Type, from: data)
                //print("UserData = \(userData.status ?? 00)")
                DispatchQueue.main.async {
                    //completion(userData,nil)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
