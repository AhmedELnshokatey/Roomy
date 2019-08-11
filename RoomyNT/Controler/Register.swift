//
//  Register.swift
//  networklayer
//
//  Created by AhmedMohamedIOS on 7/30/19.
//  Copyright © 2019 AhmedMohamedIOS. All rights reserved.
//

import UIKit

class Register: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
   
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmpasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    

    @IBAction func signUpButton(_ sender: UIButton) {
        guard let name = nameTextField.text?.Trimned , !name.isEmpty ,let email = emailTextField.text?.Trimned , !email.isEmpty , let password = passwordTextField.text , !password.isEmpty ,let confirmPassword = confirmpasswordTextField.text , !confirmPassword.isEmpty
            else{
            return
                
        }
        Api.signUp(name: name, email: email, password: password){(error : Error?,success: Bool) in if success{}
        else{}
        }
        }
    }

