//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Cem Safa on 15.07.2020.
//  Copyright © 2020 Cem Safa. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
                if let err = error {
                    let alert = UIAlertController(title: K.alertTitle, message: err.localizedDescription, preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: K.alertActionTitle, style: .default, handler: nil))
                    self.present(alert, animated: true)
                } else {
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
            }
        }
    }
    
}
