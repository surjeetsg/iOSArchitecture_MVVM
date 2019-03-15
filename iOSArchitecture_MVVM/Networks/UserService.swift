//
//  LoginAPIManager.swift
//  iOSArchitecture
//
//  Created by Amit on 23/02/18.
//  Copyright © 2018 smartData. All rights reserved.
//

import Foundation
import UIKit

public class UserService:APIService {
    
    func doLogin(email: String, password:String, complition:@escaping (Result<Any>) -> Void) {
        
        let param = [Keys.email:email, Keys.password : password]
        
        super.startService(with: .POST, path: Config.login, parameters: param, files: [], modelType: Listing.self) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .Success(let data):
                    // Parse Here
                    complition(.Success(data))
                case .Error(let message):
                    complition(.Error(message))
                }
            }
        }
    }
    
    
    
}

