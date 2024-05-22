//
//  ClassMemberViewController.swift
//  Heureux-UIKit
//
//  Created by Treasure Letter on 22/05/2024.
//

import UIKit

class ClassMemberViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navSetup()
    viewSetup()
  }
}

// MARK: - NAVIGATION SETUP
private extension ClassMemberViewController {
  func navSetup() {
    navigationItem.title = "Class Members"
    
    let closeButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeButtonTapped))
    let inviteMemberButton = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle.badge.plus"), style: .done, target: self, action: #selector(inviteMemberButton))
    navigationItem.leftBarButtonItem = closeButton
    navigationItem.rightBarButtonItem = inviteMemberButton
  }
}

// MARK: - VIEW SETUP
private extension ClassMemberViewController {
  func viewSetup() {
    view.backgroundColor = .systemGray6
  }
}

// MARK: - CATCH ACTION
private extension ClassMemberViewController {
  @objc func closeButtonTapped() {
    self.dismiss(animated: true)
  }
  
  @objc func inviteMemberButton() {
    let alertController = UIAlertController(title: "Invite Member", message: nil, preferredStyle: .alert)
    alertController.addTextField { textField in
      textField.placeholder = "Email Address"
      textField.font = .rounded(ofSize: 16, weight: .medium)
      textField.tintColor = .colorPink
      textField.textColor = .black
    }
    
    let addAction = UIAlertAction(title: "Invite", style: .default) { _ in
      guard let text = alertController.textFields![0].text else {
        return
      }
      print(text)
    }
    
    let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
    
    alertController.addAction(cancelAction)
    alertController.addAction(addAction)
    
    present(alertController, animated: true)
    
  }
}
