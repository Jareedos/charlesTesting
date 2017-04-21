//
//  AuthService.swift
//  charlesTesting
//
//  Created by Jared Sobol on 4/19/17.
//  Copyright © 2017 Appmaker. All rights reserved.
//

import Foundation
import FirebaseAuth
import UIKit


class AuthService {
    private static let _instance = AuthService()
    
    static var instance: AuthService {
        return _instance
    }
    
    func login(email:String, password: String, fromViewController vc: UIViewController, success: @escaping ()->Void) {
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            
            if let error = error as NSError? {
                if let errorCode = FIRAuthErrorCode(rawValue: error.code){
                    switch errorCode {
                    case .errorCodeInvalidEmail:
                        vc.createErrorAlert("Invalid Email", msg: "Please enter a valid email")
                    case .errorCodeWrongPassword:
                        vc.createErrorAlert("Invalid Password", msg: "Please enter a valid Password")
                    case .errorCodeNetworkError:
                        vc.createErrorAlert("Server Error", msg: "There has been a server error, Please log In again")
                    default:
                        vc.createErrorAlert("Disabled Account", msg: "Your account has been disabled please contact your company")
                    }
                    
                }
            } else {
                //Successfully login in
                success()
            }
        })
    }
    
}

extension UIViewController {
    
    func createErrorAlert(_ title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default , handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func didTapOnBackground() {
        view.endEditing(true)
    }
}


