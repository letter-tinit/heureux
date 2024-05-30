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
    let classViewController = ClassViewController()
    let classNavController = UINavigationController(rootViewController: classViewController)
    classNavController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
    
    let projectViewController = ProjectViewController()
    let projectNavController = UINavigationController(rootViewController: projectViewController)
    projectNavController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "doc.badge.gearshape"), selectedImage: UIImage(systemName: "doc.badge.gearshape.fill"))
    
    let reportViewController = ReportViewController()
    reportViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "doc.text.below.ecg"), selectedImage: UIImage(systemName: "doc.text.below.ecg.fill"))
    
    let dashboardViewController = DashboardViewController()
    dashboardViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "chart.pie"), selectedImage: UIImage(systemName: "chart.pie.fill"))

    let profileViewController = ProfileViewController()
    let profileNavController = UINavigationController(rootViewController: profileViewController)
    profileNavController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))

    
//    setViewControllers([generalNavController, profileNavController, taskViewController, reportViewController, dashboardViewController], animated: true)
    setViewControllers([classNavController, projectNavController, reportViewController, dashboardViewController, profileNavController], animated: true)
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
