//
//  TaskViewController.swift
//  Heureux-UIKit
//
//  Created by Treasure Letter on 18/05/2024.
//

import UIKit

class TaskViewController: UIViewController {
  
  var tasks = Data.tasks
  
  lazy var addButton = AddButton(color: .systemBlue)
  
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
private extension TaskViewController {
  func setupView() {
    view.backgroundColor = .white
    configNav()
    addSubView()
    layout()
    setupAction()
  }
}

// MARK: - CONFIG NAV

private extension TaskViewController {
  func configNav() {
    navigationItem.backButtonTitle = ""
    let titleLabel = CustomNavigationTitle(title: "Tasks")
    navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
  }
}


// MARK: - ADD VIEW
private extension TaskViewController {
  func addSubView() {
    view.addSubview(taskTableView)
    view.addSubview(addButton)
  }
}

// MARK: - LAYOUT
private extension TaskViewController {
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
private extension TaskViewController {
  func setupAction()  {
    taskTableView.dataSource = self
    taskTableView.delegate = self
    addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
  }
}

// MARK: - CATCH ACTION
private extension TaskViewController {
  @objc func addButtonTapped() {
//    let addTaskViewController = AddTaskViewController()
//    
//    if #available(iOS 16.0, *) {
//      let fraction = UISheetPresentationController.Detent.custom { context in
//        UIScreen.main.bounds.height / 2
//      }
//      if let presentationController = addTaskViewController.presentationController as? UISheetPresentationController {
//        presentationController.detents = [fraction, .large()]
//      }
//    } else {
//      if let presentationController = addTaskViewController.presentationController as? UISheetPresentationController {
//        presentationController.detents = [.medium(), .large()]
//      }
//    }
//    
//    present(addTaskViewController, animated: true)
    
    let alertController = UIAlertController(title: "Create Task", message: nil, preferredStyle: .alert)
    alertController.addTextField { textField in
      textField.placeholder = "Task Name"
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

extension TaskViewController: UITableViewDataSource {
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

extension TaskViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 180
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //    let task = tasks[indexPath.row]
    //    let taskDetailViewController = TaskDetailViewController()
    //    taskDetailViewController.task = task
    navigationController?.pushViewController(TaskDetailViewController(), animated: true)
  }
  
  func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    
    let deleteAction = UIContextualAction(style: .destructive, title: "Cancel") { _, _, completionHandler in
      completionHandler(true)
    }
    let image = UIImage(systemName: "trash")?.withTintColor(.systemRed, renderingMode: .alwaysOriginal).resized(to: CGSize(width: 40, height: 45))
    deleteAction.image = image
    deleteAction.backgroundColor = .systemBackground
    
    let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
    return configuration
  }
}
