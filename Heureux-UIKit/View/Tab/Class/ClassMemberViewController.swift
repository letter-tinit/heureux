//
//  ClassMemberViewController.swift
//  Heureux-UIKit
//
//  Created by Treasure Letter on 22/05/2024.
//

import UIKit

class ClassMemberViewController: UIViewController {
  
  var users: [User] = Data.users
  
  // MARK: - UI CREATION
  private let classMemberTableView: UITableView = {
    let tableView = UITableView(frame: .zero)
    tableView.register(ClassMemberTableViewCell.self, forCellReuseIdentifier: ClassMemberTableViewCell.identifier)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    return tableView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navSetup()
    viewSetup()
    actionSetup()
  }
}

// MARK: - NAVIGATION SETUP
private extension ClassMemberViewController {
  func navSetup() {
    navigationItem.title = "Class Members"
    
    let closeButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeButtonTapped))
    let inviteMemberButton = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle.badge.plus")?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal), style: .done, target: self, action: #selector(inviteMemberButton))
    navigationItem.leftBarButtonItem = closeButton
    navigationItem.rightBarButtonItem = inviteMemberButton
  }
}

// MARK: - VIEW SETUP
private extension ClassMemberViewController {
  func viewSetup() {
    view.backgroundColor = .systemGray6
    addSubView()
    layout()
    actionSetup()
  }
}

// MARK: - ADD VIEW
private extension ClassMemberViewController {
  func addSubView() {
    view.addSubview(classMemberTableView)
  }
}

// MARK: - LAYOUT
private extension ClassMemberViewController {
  func layout() {
    NSLayoutConstraint.activate([
      classMemberTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      classMemberTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      classMemberTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      classMemberTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
  }
}

// MARK: - ACTION SETUP
private extension ClassMemberViewController {
  func actionSetup() {
    classMemberTableView.delegate = self
    classMemberTableView.dataSource = self
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


// MARK: - DATA SOURCE
extension ClassMemberViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return users.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: ClassMemberTableViewCell.identifier, for: indexPath) as? ClassMemberTableViewCell else {
      return UITableViewCell()
    }
    
    let user = users[indexPath.row]
    
    tableView.separatorStyle = .none
    cell.config(user: user)
    
    return cell
  }
  
}

// MARK: - DETEGATE
extension ClassMemberViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    60
  }
}
