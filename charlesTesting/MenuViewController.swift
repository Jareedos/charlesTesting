//
//  MenuViewController.swift
//  charlesTesting
//
//  Created by Jared Sobol on 4/30/17.
//  Copyright © 2017 Appmaker. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!

    
    var menuShowing = false
    let lblTitleArray = ["Home", "Account", "Partnerships", "Legal Disclaimer"]
    
    static func instantiate() -> MenuViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        trailingConstraint.constant = -160
        view.layoutIfNeeded()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        openMenu()
    }
    
    private func openMenu() {
            trailingConstraint.constant = 0
            menuShowing = true
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
    }
    
    @IBAction func closeMenu(_ sender: Any) {
            trailingConstraint.constant = -160
            menuShowing = false
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            }, completion: { (finished: Bool) in
            self.dismiss(animated: false, completion: nil)
        })
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lblTitleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
        cell.menuTitleLbl.text = lblTitleArray[indexPath.row]
        return cell
    }

}
