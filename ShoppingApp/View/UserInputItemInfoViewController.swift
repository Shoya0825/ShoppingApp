//
//  UserInputItemInfoViewController.swift
//  ShoppingApp
//
//  Created by 1105449 on 2023/04/03.
//

import UIKit

class UserInputItemInfoViewController: UITableViewController {
    
    
    @IBOutlet var infoTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoTableView.delegate = self
    }
    
}
