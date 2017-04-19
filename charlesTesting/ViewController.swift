//
//  ViewController.swift
//  charlesTesting
//
//  Created by Jared Sobol on 4/18/17.
//  Copyright © 2017 Appmaker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var LoginBtn: UIButton!
    @IBOutlet weak var forgotPasswordBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    @IBAction func logInBtnPressed(_ sender: Any) {
    }

    @IBAction func forgotPasswordBtnPressed(_ sender: UIButton) {
    }

}

