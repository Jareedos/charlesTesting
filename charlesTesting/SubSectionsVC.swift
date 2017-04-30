//
//  SubSectionVC.swift
//  charlesTesting
//
//  Created by Jared Sobol on 4/22/17.
//  Copyright © 2017 Appmaker. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseDatabaseUI

class SubSectionsVC: UIViewController, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!

    var dataSource : FUITableViewDataSource?
    var section : Section!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = dataSource
        
        dataSource = CardTableViewDataSource.dataSource(tableView: tableView, query: SubSectionsRepository.findAll(section: section), configureCell: { (cell: CardTableViewCell, snapshot: FIRDataSnapshot) in
            cell.configure(withJob: Job(snapshot: snapshot))
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
    
    // TODO: segue to test VC
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let snapshot = dataSource?.snapshot(at: indexPath.row) {
            let job = Job(snapshot: snapshot)
            // Navigate to the next screen
            performSegue(withIdentifier: "TestsVC", sender: job)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SectionsVC {
            vc.job = sender as? Job
        }
    }
    


}
