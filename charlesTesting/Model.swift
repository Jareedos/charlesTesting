//
//  Model.swift
//  charlesTesting
//
//  Created by Jared Sobol on 4/22/17.
//  Copyright © 2017 Appmaker. All rights reserved.
//

import Foundation
import SwiftyJSON
import FirebaseDatabase

class FirebaseEntity {
    
    let key: String
    init(snapshot: FIRDataSnapshot) {
        key = snapshot.key
        
    }
    
}

class Job : FirebaseEntity {
    var title: String?
    
    /**
     Initialize with a Firebase Snapshot
     */
    override init(snapshot: FIRDataSnapshot) {
        super.init(snapshot: snapshot)
        
        if let value = snapshot.value {
            let json = JSON(value)
            title = json["title"].string
        }

    }
    
}
class Section {
    var title: String?
}
class SubSection {
    var title: String?
}
class Test {
    var title: String?
}
