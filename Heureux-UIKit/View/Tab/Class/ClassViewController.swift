//
//  ClassViewController.swift
//  Heureux-UIKit
//
//  Created by Treasure Letter on 21/05/2024.
//

import UIKit

class ClassViewController: UIViewController {
  
  var classes = Data.classes
  
  var inProgress = Data.classes.filter { $0.status == .inProgress}
  
  var finish = Data.classes.filter { $0.status == .finished}
  
  lazy var addButton = AddButton(color: .systemRed)
  
  lazy var classTableView: UITableView = {
    let tableView = UITableView(frame: .zero)
    tableView.showsVerticalScrollIndicator = false
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.register(ClassTableViewCell.self, forCellReuseIdentifier: ClassTableViewCell.identifier)
    return tableView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
}

// MARK: - SETTUP VIEW
private extension ClassViewController {
  func setupView() {
    view.backgroundColor = .white
    configNav()
    addSubView()
    layout()
    setupAction()
    setupData()
  }
}

// MARK: - CONFIG NAV
private extension ClassViewController {
  func configNav() {
    let titleLabel = CustomNavigationTitle(title: "Classes")
    DispatchQueue.main.async { [weak self] in
      self?.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
    }
    navigationItem.backButtonTitle = ""
  }
}

// MARK: - ADD VIEW
private extension ClassViewController {
  func addSubView() {
    view.addSubview(classTableView)
    classTableView.insetsContentViewsToSafeArea = true
    classTableView.insetsLayoutMarginsFromSafeArea = true
    classTableView.layoutMargins = UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0)
    classTableView.insetsContentViewsToSafeArea = true
    view.addSubview(addButton)
  }
}

// MARK: - LAYOUT
private extension ClassViewController {
  func layout() {
    NSLayoutConstraint.activate([
      addButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
      addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
    ])
    
    NSLayoutConstraint.activate([
      classTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 00),
      classTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
      classTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
      classTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
    ])
  }
}

// MARK: - SETUP ACTION
private extension ClassViewController {
  func setupAction() {
    classTableView.delegate = self
    classTableView.dataSource = self
    addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
  }
}

// MARK: - CATCH ACTION
private extension ClassViewController {
  @objc func addButtonTapped() {
    let alertController = UIAlertController(title: "Create Class", message: nil, preferredStyle: .alert)
    alertController.addTextField { textField in
      textField.placeholder = "Class Name"
      textField.font = .rounded(ofSize: 16, weight: .medium)
      textField.tintColor = .colorPink
      textField.textColor = .black
    }
    
    let addAction = UIAlertAction(title: "Add", style: .default) { _ in
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

// MARK: - SETUP DATA
private extension ClassViewController {
  func setupData() {
    //    classes
  }
}

extension ClassViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    2
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 0 {
      return inProgress.count
    } else {
      return finish.count
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: ClassTableViewCell.identifier, for: indexPath) as? ClassTableViewCell else {
      return UITableViewCell()
    }
    
    var indexClass: Class?
    if indexPath.section == 0 {
      indexClass = inProgress[indexPath.row]
    } else {
      indexClass = finish[indexPath.row]
    }
    
    cell.config(item: indexClass!)
    cell.selectionStyle = .none
    tableView.separatorStyle = .none
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    if section == 0 {
      return "In Progress"
    } else {
      return "Finished"
    }
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let headerView = UIView()
    headerView.backgroundColor = section == 0 ?
    UIColor.systemRed.withAlphaComponent(0.6) :
    UIColor.systemGreen.withAlphaComponent(0.6)
    headerView.layer.shadowColor = UIColor.black.cgColor
    headerView.layer.shadowRadius = 7
    headerView.layer.shadowOpacity = 0.4
    headerView.layer.shadowOffset = CGSize(width: 10, height: 10)
    
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .black
    label.font = .rounded(ofSize: 16, weight: .bold)
    label.text = self.tableView(tableView, titleForHeaderInSection: section)
    headerView.addSubview(label)
    
    NSLayoutConstraint.activate([
      label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
      label.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
      label.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 8),
      label.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -8)
    ])
    
    return headerView
  }
}

extension ClassViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 70
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("Tapped")
    let classDetailViewController = ClassDetailViewController()
    navigationController?.pushViewController(classDetailViewController, animated: true)
  }
}

