//
//  RoundedTextField.swift
//  charlesTesting
//
//  Created by Jared Sobol on 4/19/17.
//  Copyright © 2017 Appmaker. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedTextField: UITextField {
    
    @IBInspectable var cournerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cournerRadius
            //layer.masksToBounds = cournerRadius > 0
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
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var bgColor: UIColor? {
        didSet {
            backgroundColor = bgColor
        }
    }
    
    @IBInspectable var placeholderColor: UIColor? {
        didSet {
            let rawString = attributedPlaceholder?.string != nil ? attributedPlaceholder!.string : ""
            let str = NSAttributedString(string: rawString, attributes: [NSForegroundColorAttributeName: placeholderColor!])
            attributedPlaceholder = str
        }
    }
    
}
