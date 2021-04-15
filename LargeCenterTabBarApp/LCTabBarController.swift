//
//  LCTabBarController.swift
//  LargeCenterTabBarApp
//
//  Created by Daichi Hayashi on 2021/04/15.
//

import UIKit

class LCTabBarController: UITabBarController, LCTabBarDelegate, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        let lcTabBar = tabBar as! LCTabBar
        lcTabBar.lcDelegate = self

        delegate = self
    }

    // MARK: - LCTabBarDelegate
    func didTapCenterButton() {
        self.selectedIndex = 2
    }

    // MARK: - UITabBarControllerDelegate
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        // CenterViewController への画面遷移は centerButton によってやりたいので false を返す
        if viewController is CenterViewController {
            return false
        }
        return true
    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("didSelect: \(tabBarController.selectedIndex)")
    }
}
