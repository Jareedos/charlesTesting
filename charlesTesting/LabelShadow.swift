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
            layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
            layer.shadowOpacity = 0.8
            layer.shadowRadius = 5
            layer.shadowOffset = CGSize(width: 1, height: 1)
        }
    }
   

}
