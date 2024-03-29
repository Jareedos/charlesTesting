//
//  JobsVC.swift
//  charlesTesting
//
//  Created by Jared Sobol on 4/21/17.
//  Copyright © 2017 Appmaker. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseDatabaseUI

class JobsVC: UIViewController, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource : FUITableViewDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = dataSource
        
        dataSource = CardTableViewDataSource.dataSource(tableView: tableView, query: JobsRepository.findAll(), configureCell: { (cell: CardTableViewCell, snapshot: FIRDataSnapshot) in
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let snapshot = dataSource?.snapshot(at: indexPath.row) {
            let job = Job(snapshot: snapshot)
            // Navigate to the next screen
            performSegue(withIdentifier: "SectionsVC", sender: job)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SectionsVC {
            vc.job = sender as? Job
        }
    }
    
    
}
