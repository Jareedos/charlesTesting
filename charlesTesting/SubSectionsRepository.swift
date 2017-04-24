//
//  SubSectionsRepository.swift
//  charlesTesting
//
//  Created by Jared Sobol on 4/24/17.
//  Copyright © 2017 Appmaker. All rights reserved.
//

import Foundation
import FirebaseDatabase

class SubSectionsRepository {
    
    static var reference: FIRDatabaseReference {
        return FIRDatabase.database().reference().child("subSections")
    }
    
    static func findAll(section: Section) -> FIRDatabaseQuery {
        return reference.child(section.key).queryOrderedByKey()
    }
    
}


