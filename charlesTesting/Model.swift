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
    var location: String?
    var sectionCount: Int = 0
    
    /**
     Initialize with a Firebase Snapshot
     */
    override init(snapshot: FIRDataSnapshot) {
        super.init(snapshot: snapshot)
        
        if let value = snapshot.value {
            let json = JSON(value)
            title = json["title"].string
            location = json["location"].string
            sectionCount = json["sectionCount"].intValue
        }
    }
    
}
class Section : FirebaseEntity {
    var title: String?
    var subSectionCount: Int = 0
    var jobTitle: String?
    
    /**
     Initialize with a Firebase Snapshot
     */
    override init(snapshot: FIRDataSnapshot) {
        super.init(snapshot: snapshot)
        
        if let value = snapshot.value {
            let json = JSON(value)
            title = json["title"].string
            subSectionCount = json["subSectionCount"].intValue
        }
    }
}
class SubSection : FirebaseEntity {
    var title: String?
    var testCount: Int = 0
    var jobTitle: String?
    
    /**
     Initialize with a Firebase Snapshot
     */
    override init(snapshot: FIRDataSnapshot) {
        super.init(snapshot: snapshot)
        
        if let value = snapshot.value {
            let json = JSON(value)
            title = json["title"].string
            testCount = json["testCount"].intValue
        }
    }
}
class Test : FirebaseEntity{
    var title: String?
    var versionDate: String?
    var standardTitle: String?
    
    /**
     Initialize with a Firebase Snapshot
     */
    override init(snapshot: FIRDataSnapshot) {
        super.init(snapshot: snapshot)
        
        if let value = snapshot.value {
            let json = JSON(value)
            title = json["title"].string
            versionDate = json["versionDate"].string
            standardTitle = json["standardTitle"].string
        }
    }
}
