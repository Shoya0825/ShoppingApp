//
//  GoodsListViewController.swift
//  ShoppingApp
//
//  Created by 1105449 on 2023/03/31.
//

import UIKit
import RealmSwift


class ItemListViewController: UITableViewController, UISearchBarDelegate {
    
    
    @IBOutlet var itemListTableView: UITableView!
    var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemListTableView.delegate = self
        itemListTableView.dataSource = self
        
        tableView.register(UINib(nibName: "ListedItemCell", bundle: nil), forCellReuseIdentifier: "ListedItemCell")
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.backgroundColor = UIColor.white
        
        setupSearchBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func setupSearchBar() {
        if let navigationBarFrame = self.navigationController?.navigationBar.bounds {
            let searchBar: UISearchBar = UISearchBar(frame: navigationBarFrame)
            searchBar.delegate = self
            searchBar.placeholder = "なにをお探しですか？"
            searchBar.tintColor = UIColor.gray
            searchBar.keyboardType = UIKeyboardType.default
            
            let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44))
            
            let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let doneButton = UIBarButtonItem(title: "完了", style: .done, target: self, action: #selector(didTappedDoneButton))
            
            toolbar.items = [space, doneButton]
            searchBar.inputAccessoryView = toolbar
            
            navigationItem.titleView = searchBar
            navigationItem.titleView?.frame = searchBar.frame
            self.searchBar = searchBar
        }
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
    override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    @objc func didTappedDoneButton() {
        searchBar.resignFirstResponder()
    }
}
