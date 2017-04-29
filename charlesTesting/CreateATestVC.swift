//
//  CreateATestVC.swift
//  charlesTesting
//
//  Created by Jared Sobol on 4/23/17.
//  Copyright © 2017 Appmaker. All rights reserved.
//

import UIKit

class CreateATestVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func prepareforUnwind (segue:UIStoryboardSegue) {
        
    }
    
    override func unwind(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        let segue = LeftRightSegue(identifier: unwindSegue.identifier, source: unwindSegue.source, destination: unwindSegue.destination)
        segue.perform()
    }

  

}
