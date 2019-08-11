//
//  Signin.swift
//  networklayer
//
//  Created by AhmedMohamedIOS on 8/5/19.
//  Copyright © 2019 AhmedMohamedIOS. All rights reserved.
//

import UIKit

class Signin: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        guard let email = emailTextField.text?.Trimned , !email.isEmpty else {print("ahmed"); return }
        guard let password = passwordTextField.text?.Trimned , !password.isEmpty else{
            return}
        Api.Login(email: email, password: password){(error : Error?,success: Bool) in if success{
            self.performSegue(withIdentifier:"RoomTableSegue", sender: nil)
        }
        else{}
        }
        
    }
    

}
