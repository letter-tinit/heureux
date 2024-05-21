//
//  ClassViewController.swift
//  Heureux-UIKit
//
//  Created by Treasure Letter on 21/05/2024.
//

import UIKit

class ClassViewController: UIViewController {
  
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
  }
  
  func configNav() {
    let titleLabel = CustomNavigationTitle(title: "Classes")
    DispatchQueue.main.async { [weak self] in
      self?.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
    }
  }
}
// MARK: - ADD VIEW
private extension ClassViewController {
  func addSubView() {
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
  }
}

// MARK: - SETUP ACTION
private extension ClassViewController {
  func setupAction()  {
  }
}

// MARK: - CATCH ACTION
private extension ClassViewController {}

extension ClassViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    UITableViewCell()
  }
}

extension ClassViewController: UITableViewDelegate {}

