//
//  JobsRepository.swift
//  charlesTesting
//
//  Created by Jared Sobol on 4/22/17.
//  Copyright © 2017 Appmaker. All rights reserved.
//

import Foundation
import FirebaseDatabase

class JobsRepository {
    
    static var reference: FIRDatabaseReference {
        return FIRDatabase.database().reference().child("jobs")
    }
    
    static func findAll() -> FIRDatabaseQuery {
        return reference.queryOrderedByKey()
    }
    
}
