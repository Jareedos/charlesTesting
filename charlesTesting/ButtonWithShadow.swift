//
//  ButtonWithShadow.swift
//  charlesTesting
//
//  Created by Jared Sobol on 4/22/17.
//  Copyright © 2017 Appmaker. All rights reserved.
//

import UIKit

class ButtonWithShadow: UIButton {

    func setupShadow() {
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 1, height: 1)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupShadow()
    }
}
