//
//  TestsRepository.swift
//  charlesTesting
//
//  Created by Jared Sobol on 4/24/17.
//  Copyright © 2017 Appmaker. All rights reserved.
//

import Foundation

import FirebaseDatabase

class TestsRepository {
    
    static var reference: FIRDatabaseReference {
        return FIRDatabase.database().reference().child("tests")
    }
    
    static func findAll(subSection: SubSection) -> FIRDatabaseQuery {
        return reference.child(subSection.key).queryOrderedByKey()
    }
    
}
