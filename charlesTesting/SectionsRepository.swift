//
//  SectionsRepository.swift
//  charlesTesting
//
//  Created by Jared Sobol on 4/24/17.
//  Copyright © 2017 Appmaker. All rights reserved.
//

import Foundation
import FirebaseDatabase

class SectionsRepository {
    
    static var reference: FIRDatabaseReference {
        return FIRDatabase.database().reference().child("sections")
    }
    
    static func findAll(job: Job) -> FIRDatabaseQuery {
        return reference.child(job.key).queryOrderedByKey()
    }
    
}

