//
//  MainTabBarViewController.swift
//  Heureux-UIKit
//
//  Created by Treasure Letter on 18/05/2024.
//

import UIKit

class MainTabBarViewController: UITabBarController, UITabBarControllerDelegate {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTab()
    setupTabBarAppearance()
    delegate = self
  }
  
  func setupTab() {
    let generalViewController = GeneralViewController()
    let generalNavController = UINavigationController(rootViewController: generalViewController)
    generalNavController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "general"), tag: 0)
    generalNavController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0);
    
    let taskViewController = TaskViewController()
    let taskNavController = UINavigationController(rootViewController: taskViewController)
    taskNavController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "task"), tag: 1)
    taskNavController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0);
    
    let reportViewController = ReportViewController()
    reportViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "report"), tag: 2)
    reportViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0);
    
    let dashboardViewController = DashboardViewController()
    dashboardViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "dashboard"), tag: 3)
    dashboardViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0);
    
    let profileViewController = ProfileViewController()
    let profileNavController = UINavigationController(rootViewController: profileViewController)
    profileNavController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "profile"), tag: 4)
    profileNavController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0);
    
//    setViewControllers([generalNavController, profileNavController, taskViewController, reportViewController, dashboardViewController], animated: true)
    setViewControllers([profileNavController, generalNavController, reportViewController, dashboardViewController], animated: true)
  }
  
  func setupTabBarAppearance() {
    tabBar.backgroundColor = .white
    
    // MARK: - SHADOW
    tabBar.shadowImage = UIImage()
    tabBar.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
    tabBar.layer.shadowOffset = CGSize(width: -4, height: -6)
    tabBar.layer.shadowOpacity = 0.5
    
    // MARK: - Tint Color
    tabBar.tintColor = .colorPink
  }
}
