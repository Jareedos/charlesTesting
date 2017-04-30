//
//  SectionsVC.swift
//  charlesTesting
//
//  Created by Jared Sobol on 4/22/17.
//  Copyright © 2017 Appmaker. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseDatabaseUI

class SectionsVC: UIViewController, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!

   
    var dataSource : FUITableViewDataSource?
    
    var job: Job!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = dataSource
        
        dataSource = CardTableViewDataSource.dataSource(tableView: tableView, query: SectionsRepository.findAll(job: job), configureCell: { [weak self] (cell: CardTableViewCell, snapshot: FIRDataSnapshot) in
            let section = Section(snapshot: snapshot)
            section.jobTitle = self?.job.title // Assign the title (so we don't need to keep that redundant information in the database)
            cell.configure(anything: section)
        })
        dataSource?.bind(to: tableView)
    }
    
    @IBAction func prepareforUnwind (segue:UIStoryboardSegue) {
        
    }
    
    override func unwind(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        let segue = LeftRightSegue(identifier: unwindSegue.identifier, source: unwindSegue.source, destination: unwindSegue.destination)
        segue.perform()
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let snapshot = dataSource?.snapshot(at: indexPath.row) {
            let section = Section(snapshot: snapshot)
            // Navigate to the next screen
            performSegue(withIdentifier: "SubsectionsVC", sender: section)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SubSectionsVC {
            vc.section = sender as? Section
        }
    }

    

}
