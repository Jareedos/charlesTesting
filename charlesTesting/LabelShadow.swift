//
//  LabelShadow.swift
//  charlesTesting
//
//  Created by Jared Sobol on 4/21/17.
//  Copyright © 2017 Appmaker. All rights reserved.
//

import UIKit

@IBDesignable
class LabelShadow: UILabel {
    @IBInspectable var borderShadow: UIColor? {
        didSet {
            layer.shadowRadius = 10.0
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOffset = CGSize(width: 1, height: 2)
            layer.shadowOpacity = 1.0
        }
    }
   

}
