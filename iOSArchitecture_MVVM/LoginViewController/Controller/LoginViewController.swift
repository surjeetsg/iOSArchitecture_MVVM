//
//  LoginViewController.swift
//  iOSArchitecture_MVVM
//
//  Created by Surjeet Singh on 14/03/2019.
//  Copyright © 2019 Surjeet Singh. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    lazy var viewModel: LoginViewModel = {
        let obj = LoginViewModel()
        self.baseVwModel = obj
        return obj
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.initViewModel()
    }
    
    func initViewModel() {
                
        viewModel.moveControlClosure = { [weak self] () in
            DispatchQueue.main.async {
                self?.navigateToHomeScreen()
            }
        }
        
    }

    @IBAction func onLoginClick(_ sender: UIButton) {
        viewModel.validate(emailTextField.text, password: passwordTextField.text)
    }
    
    
    func navigateToHomeScreen() {
        let coontroller = self.storyboard?.instantiateViewController(withIdentifier: HomeViewController.className) as! HomeViewController
        self.navigationController?.pushViewController(coontroller, animated: true)
    }
    

}
