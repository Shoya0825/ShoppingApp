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
        tableView.register(UINib(nibName: "ListedItemCell", bundle: nil), forCellReuseIdentifier: "ListedItemCell")
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListedItemCell") as! ListedItemCell
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
