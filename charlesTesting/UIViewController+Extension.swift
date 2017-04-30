//
//  UIViewController+Extension.swift
//  charlesTesting
//
//  Created by Jared Sobol on 4/30/17.
//  Copyright © 2017 Appmaker. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    @IBAction func toggleMenu(_ sender: UIButton) {
        let vc = MenuViewController.instantiate()
        present(vc, animated: false, completion: nil)
    }
    
}
