//
//  RoundedImage.swift
//  charlesTesting
//
//  Created by Jared Sobol on 5/17/17.
//  Copyright © 2017 Appmaker. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedImage: UIImageView {
    @IBInspectable var cournerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cournerRadius
            layer.masksToBounds = cournerRadius > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
            
        }
    }
    
    @IBInspectable var borderShadow: UIColor? {
        didSet {
            layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
            layer.shadowOpacity = 0.8
            layer.shadowRadius = 5
            layer.shadowOffset = CGSize(width: 1, height: 1)
        }
    }
    

}
