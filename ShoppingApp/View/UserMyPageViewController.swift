//
//  UserMyPageViewController.swift
//  ShoppingApp
//
//  Created by 1105449 on 2023/03/10.
//

import UIKit

class UserMyPageViewController: UITableViewController {
    
    @IBOutlet var myPageTableView: UITableView!
    
    var userCreditCellHeight:CGFloat = 120
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myPageTableView.delegate = self
        myPageTableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(UINib(nibName: "UserIconCell", bundle: nil), forCellReuseIdentifier: "UserIconCell")
        tableView.register(UINib(nibName: "UserCreditCell", bundle: nil), forCellReuseIdentifier: "UserCreditCell")
        
        
    }
    
    enum UserMyPageCell: Int, CaseIterable {
        case firstUserCell
        case secondeUserCell
        
        var cellIdentifier: String {
            switch self {
                case .firstUserCell: return "UserIconCell"
                case .secondeUserCell: return "UserCreditCell"
            }
        }
        var cellHeight: CGFloat {
            switch self {
                case .firstUserCell: return 120
                case .secondeUserCell: return 120
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserMyPageCell.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellIndexPath = UserMyPageCell(rawValue: indexPath.row)!
        
        switch cellIndexPath {
            case .firstUserCell: return cellIndexPath.cellHeight
            case .secondeUserCell: return userCreditCellHeight
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIndexPath = UserMyPageCell(rawValue: indexPath.row)!
        
        switch cellIndexPath {
        case .firstUserCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIndexPath.cellIdentifier) as! UserIconCell
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
            return cell
        case .secondeUserCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIndexPath.cellIdentifier) as! UserCreditCell
            cell.creditChargeButton.addTarget(self, action: #selector(didTappedCreditChargeButton(sender:)), for: .touchUpInside)
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        let willSelctRow = UserMyPageCell(rawValue: indexPath.row)!
        
        if willSelctRow == .firstUserCell {
            return nil
        }
        return indexPath
    }
    
    @objc func didTappedCreditChargeButton(sender: UIButton) {
        userCreditCellHeight = userCreditCellHeight == 120 ? 200 : 120
        myPageTableView.reloadData()
    }
    
}
