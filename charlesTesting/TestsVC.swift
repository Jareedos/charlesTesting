//
//  TestsVC.swift
//  charlesTesting
//
//  Created by Jared Sobol on 4/26/17.
//  Copyright © 2017 Appmaker. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseDatabaseUI

class TestsVC : UIViewController, UITableViewDelegate {
    var dataSource : FUITableViewDataSource?
    @IBOutlet weak var tableView: UITableView!
    var subSection: SubSection!
    
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
            performSegue(withIdentifier: "CreateATestVC", sender: job)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? TestsVC {
            vc.subSection = sender as? SubSection
        }
    }
    
}
    

