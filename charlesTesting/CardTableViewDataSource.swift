//
//  CardTableViewDataSource.swift
//  charlesTesting
//
//  Created by Jared Sobol on 4/22/17.
//  Copyright © 2017 Appmaker. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabaseUI

class CardTableViewDataSource : FUITableViewDataSource{
    
    
    static func dataSource(tableView: UITableView, query: FIRDatabaseQuery, configureCell : @escaping (_ cell: CardTableViewCell, _ snapshot: FIRDataSnapshot) -> Void) -> CardTableViewDataSource {
        
        let dataSource = CardTableViewDataSource(query: query, populateCell: { (tableView: UITableView, indexPath: IndexPath, snapshot: FIRDataSnapshot) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "CardTableViewCell", for: indexPath) as! CardTableViewCell
            configureCell(cell, snapshot)
            return cell
        })
        
        dataSource.tableView = tableView
        tableView.register(UINib(nibName: "CardTableViewCell", bundle: nil), forCellReuseIdentifier: "CardTableViewCell")
        
        return dataSource
    }
    
    
    func tableViewasdfasf(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CardTableViewCell", for: indexPath) as! CardTableViewCell
        cell.configure(anything: items[indexPath.row])
        return cell
    }
}

