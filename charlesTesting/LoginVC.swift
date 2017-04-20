//
//  ViewController.swift
//  charlesTesting
//
//  Created by Jared Sobol on 4/18/17.
//  Copyright © 2017 Appmaker. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var LoginBtn: UIButton!
    @IBOutlet weak var forgotPasswordBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        guard FIRAuth.auth()?.currentUser != nil else {
            return
            //asdf
        }
    }
 
    @IBAction func logInBtnPressed(_ sender: Any) {
        if let email = emailTextField.text, let pass = passwordTxtField.text, email.characters.count > 0 && pass.characters.count > 0 {
        AuthService.instance.login(email: email, password: pass)
        } else {
            let alert = UIAlertController(title: "Username and Password Required", message: "You must enter both a username and password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    

    @IBAction func forgotPasswordBtnPressed(_ sender: UIButton) {
    }

}

