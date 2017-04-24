//
//  CardTableViewCell.swift
//  charlesTesting
//
//  Created by Jared Sobol on 4/22/17.
//  Copyright © 2017 Appmaker. All rights reserved.
//

import UIKit

class CardTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var titleLabel : UILabel?
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var numberOfItemsLabel: UILabel!
    
    func configure(anything: Any) {
        if let job = anything as? Job {
            configure(withJob: job)
        }
        if let section = anything as? Section {
            configure(withSection: section)
        }
        if let subSection = anything as? SubSection {
            configure(withSubSection: subSection)
        }
        if let test = anything as? Test {
            configure(withTest: test)
        }
        if let string = anything as? String {
            configure(withString: string)
        }
    }
    
    func configure(withString string: String) {
        titleLabel?.text = string

    }
    func configure(withJob job: Job) {
        titleLabel?.text = job.title
        numberOfItemsLabel?.text = "\(job.sectionCount) Sections"
        subtitleLabel?.text = job.location
    }
    func configure(withSection section: Section) {
        titleLabel?.text = section.title
        numberOfItemsLabel?.text = "\(section.subSectionCount) SubSections"
        subtitleLabel?.text = section.jobTitle
    }
    func configure(withSubSection subSection: SubSection) {
        titleLabel?.text = subSection.title
        numberOfItemsLabel?.text = "\(subSection.testCount) Tests"
        subtitleLabel?.text = subSection.jobTitle
    }
    func configure(withTest test: Test) {
        titleLabel?.text = test.title
    }

}
