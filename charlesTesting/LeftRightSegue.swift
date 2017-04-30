//
//  LeftRightSegue.swift
//  charlesTesting
//
//  Created by Jared Sobol on 4/29/17.
//  Copyright © 2017 Appmaker. All rights reserved.
//

import UIKit

class LeftRightSegue: UIStoryboardSegue {
    override func perform()
    {
        let src = self.source
        let dst = self.destination
        
        //dst.dismiss(animated: false, completion: nil)
        src.modalPresentationStyle = .overCurrentContext
        //dst.present(src, animated: false, completion: nil)
        dst.view.superview?.insertSubview(src.view, aboveSubview: src.view)
        
        UIView.animate(withDuration: 0.28,
                       delay: 0.0,
                       options: UIViewAnimationOptions.curveEaseInOut,
                       animations: {
                        src.view.transform = CGAffineTransform(translationX: src.view.frame.size.width, y: 0)
        },
                       completion: { finished in
                        dst.dismiss(animated: false, completion: nil)
        }
        )
    }
}
