//
//  ProfileEditViewController.swift
//  Heureux-UIKit
//
//  Created by Treasure Letter on 19/05/2024.
//

import UIKit

class ProfileEditViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    navConfig()
  }
  
  private func navConfig() {
    let doneButton = UIButton(frame: .zero)
    
    var config = UIButton.Configuration.plain()
    config.baseForegroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
    let attributes: [NSAttributedString.Key: Any] = [
      .font: UIFont.rounded(ofSize: 18, weight: .bold)
    ]
    let attributedTitle = NSAttributedString(string: "Done", attributes: attributes)
    config.attributedTitle = AttributedString(attributedTitle)
    doneButton.configuration = config
    doneButton.addTarget(self, action: #selector(doneTapped), for: .touchUpInside)
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(customView: doneButton)
  }
}

// MARK: - SETUP
private extension ProfileEditViewController {
  func setupView() {
    view.backgroundColor = .systemBackground
    addSubView()
    setupLayout()
  }
}

private extension ProfileEditViewController {
  // MARK: - ADD VIEW
  func addSubView() {
    
  }
}

// MARK: - LAYOUT
private extension ProfileEditViewController {
  func setupLayout() {
    
  }
  
}
private extension ProfileEditViewController {
  // MARK: - SETUP ACTION
  func setupAction() {
    
  }
  
  // MARK: - CATCH ACTION
  @objc func doneTapped() {
    print("Tapped")
  }
}
