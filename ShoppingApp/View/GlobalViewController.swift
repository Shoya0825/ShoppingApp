//
//  GlobalViewController.swift
//  ShoppingApp
//
//  Created by 1105449 on 2023/03/31.
//

import UIKit

final class GlobalViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setupTab()
    }
    
    
    private func setupTab() {
        let vc1 = LoginViewController()
        vc1.tabBarItem = UITabBarItem(title: "tab1", image: .none, tag: 0)

        let vc2 = UserMyPageViewController()
        vc2.tabBarItem = UITabBarItem(title: "tab2", image: .none, tag: 0)

        viewControllers = [vc1, vc2]
    }
}
