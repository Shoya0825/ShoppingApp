//
//  GoodsListViewController.swift
//  ShoppingApp
//
//  Created by 1105449 on 2023/03/31.
//

import UIKit


class ItemListViewController: UITableViewController {
    
    
    @IBOutlet var itemListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemListTableView.delegate = self
    }
    
    
    
    
    
}
