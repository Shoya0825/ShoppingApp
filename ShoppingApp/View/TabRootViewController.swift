//
//  TabRootViewController.swift
//  ShoppingApp
//
//  Created by 1105449 on 2023/03/31.
//

import UIKit

class TabRootViewController: UITabBarController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var tabContainerView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTab()
    }
    
    private func setupTab() {
        let vc1 = UIStoryboard(name: "ItemList", bundle: nil).instantiateViewController(withIdentifier: "ItemList")
        vc1.tabBarItem = UITabBarItem(title: "tab1", image: .none, tag: 0)

        let vc2 = UIStoryboard(name: "UserMyPage", bundle: nil).instantiateViewController(withIdentifier: "UserMyPage")
        vc2.tabBarItem = UITabBarItem(title: "tab2", image: .none, tag: 0)

        viewControllers = [vc1, vc2]
    }
}
