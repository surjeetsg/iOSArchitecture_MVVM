//
//  LoginViewModel.swift
//  iOSArchitecture_MVVM
//
//  Created by Surjeet Singh on 14/03/2019.
//  Copyright © 2019 Surjeet Singh. All rights reserved.
//

import UIKit

class LoginViewModel: BaseViewModel {
    
    func validate(_ email: String?, password: String?) {
        
        guard let mail = email, mail.isValidEmail() else {
            self.errorMessage = AlertMessage.INVALID_EMAIL
            return
        }
        
        guard let pswd = password, pswd.count >= 6 else {
            self.errorMessage = AlertMessage.INVALID_PASSWORD
            return
        }
        self.loginApi(mail, password: pswd)
    }
    
    func loginApi(_ email: String, password: String) {
        self.isLoading = true
        UserService().doLogin(email: email, password: password) { (result) in
           self.isLoading = false
            switch result {
            case .Success(let data):
                
                self.isApiSuccessResult = true
                
            case .Error(let message):
                self.errorMessage = message
            }
        }
    }
}
