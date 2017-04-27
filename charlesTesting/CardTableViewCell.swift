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
        if job.sectionCount == 1 {
          numberOfItemsLabel?.text = "\(job.sectionCount) Section"
        } else {
          numberOfItemsLabel?.text = "\(job.sectionCount) Sections"
        }
        subtitleLabel?.text = job.location
    }
    func configure(withSection section: Section) {
        titleLabel?.text = section.title
        if section.subSectionCount == 1 {
        numberOfItemsLabel?.text = "\(section.subSectionCount) SubSection"
        } else {
        numberOfItemsLabel?.text = "\(section.subSectionCount) SubSections"
        }
        subtitleLabel?.text = section.jobTitle
    }
    func configure(withSubSection subSection: SubSection) {
        titleLabel?.text = subSection.title
        if subSection.testCount == 1 {
        numberOfItemsLabel?.text = "\(subSection.testCount) Test"
        } else {
        numberOfItemsLabel?.text = "\(subSection.testCount) Tests"
        }
        subtitleLabel?.text = subSection.jobTitle
    }
    
    func configure(withTest test: Test) {
        titleLabel?.text = test.title
        numberOfItemsLabel?.text = test.versionDate
        subtitleLabel?.text = test.standardTitle
    }

}
