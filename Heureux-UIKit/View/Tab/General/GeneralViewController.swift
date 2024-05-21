//
//  GeneralViewController.swift
//  Heureux-UIKit
//
//  Created by Treasure Letter on 18/05/2024.
//

import UIKit

class GeneralViewController: UIViewController {
  
  lazy var addButton: UIButton = {
    let button = UIButton(frame: .zero)
    
    let config = UIImage.SymbolConfiguration(font: .rounded(ofSize: 30, weight: .bold))
    button.setImage(UIImage(systemName: "plus", withConfiguration: config), for: .normal)
    button.backgroundColor = .systemBlue.withAlphaComponent(0.6)
    button.layer.shadowColor = UIColor.black.cgColor
    button.layer.shadowRadius = 7
    button.layer.shadowOpacity = 0.4
    button.layer.shadowOffset = CGSize(width: 10, height: 10)
    button.layer.cornerRadius = 30
    button.tintColor = .white
    
    button.translatesAutoresizingMaskIntoConstraints = false
    button.widthAnchor.constraint(equalToConstant: 60).isActive = true
    button.heightAnchor.constraint(equalToConstant: 60).isActive = true
    return button
  }()
  
  lazy var taskTableView: UITableView = {
    let tableView = UITableView(frame: .zero)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.register(TaskTableViewCell.self, forCellReuseIdentifier: TaskTableViewCell.identifier)
    return tableView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
}

// MARK: - SETTUP VIEW
private extension GeneralViewController {
  func setupView() {
    view.backgroundColor = .white
    configNav()
    addSubView()
    layout()
    setupAction()
  }
  
  func configNav() {
    let titleLabel = CustomNavigationTitle(title: "Classes")
    navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
  }
}
// MARK: - ADD VIEW
private extension GeneralViewController {
  func addSubView() {
    view.addSubview(taskTableView)
    view.addSubview(addButton)
  }
}

// MARK: - LAYOUT
private extension GeneralViewController {
  func layout() {
    NSLayoutConstraint.activate([
      addButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
      addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
    ])
    
    NSLayoutConstraint.activate([
      taskTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
      taskTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
      taskTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
      taskTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
    ])
  }
}

// MARK: - SETUP ACTION
private extension GeneralViewController {
  func setupAction()  {
    taskTableView.dataSource = self
    taskTableView.delegate = self
    addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
  }
}

// MARK: - CATCH ACTION
private extension GeneralViewController {
  @objc func addButtonTapped() {
    let addTaskViewController = AddTaskViewController()
    
    if #available(iOS 16.0, *) {
      let fraction = UISheetPresentationController.Detent.custom { context in
        UIScreen.main.bounds.height / 2
      }
      if let presentationController = addTaskViewController.presentationController as? UISheetPresentationController {
        presentationController.detents = [fraction, .large()]
      }
    } else {
      if let presentationController = addTaskViewController.presentationController as? UISheetPresentationController {
        presentationController.detents = [.medium(), .large()]
      }
    }
        
    present(addTaskViewController, animated: true)
  }
}

extension GeneralViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    Data.tasks.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.identifier, for: indexPath) as? TaskTableViewCell else {
      return UITableViewCell()
    }
    
    let task = Data.tasks[indexPath.row]
    
    cell.selectionStyle = .none
    tableView.separatorStyle = .none
    tableView.showsVerticalScrollIndicator = false
    cell.config(task: task)
    
    return cell
  }
  
}

extension GeneralViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 180
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("A")
  }
}
