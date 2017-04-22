//
//  RoundedView.swift
//  charlesTesting
//
//  Created by Jared Sobol on 4/21/17.
//  Copyright © 2017 Appmaker. All rights reserved.
//

import UIKit

class RoundedView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 10
        layer.shadowOffset = CGSize(width: 1, height: 1)
    }

}
