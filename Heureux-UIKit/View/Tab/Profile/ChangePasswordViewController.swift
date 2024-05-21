//
//  ChangePasswordViewController.swift
//  Heureux-UIKit
//
//  Created by Treasure Letter on 21/05/2024.
//

import UIKit
import Lottie

class ChangePasswordViewController: UIViewController {
  // MARK: - Init view
  private let animation: LottieAnimationView = {
    let animationView: LottieAnimationView
    animationView = .init(name: "authentication")
    animationView.loopMode = .loop
    animationView.animationSpeed = 1
    animationView.play(fromProgress: 0, toProgress: 0.9)
    animationView.contentMode = .scaleAspectFit
    animationView.translatesAutoresizingMaskIntoConstraints = false
    return animationView
  }()
  
  private let oldPasswordTextField = RegisterTextField(symbol: "pencil", placeholder: "Old password")
  private let newPasswordTextField = RegisterTextField(symbol: "pencil", placeholder: "New password")
  private let confirmPasswordTextField = RegisterTextField(symbol: "pencil", placeholder: "Confirm password")
  private let saveButton = StrokeButton(title: "Save change")

  override func viewDidLoad() {
    super.viewDidLoad()
//    navigationItem.rightBarButtonItem = UIBarButtonItem(customView: CustomNavigationTitle(title: "A"))
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "A", style: .done, target: self, action: nil)
    setupView()
  }
  
}


// MARK: - VIEW SETUP
private extension ChangePasswordViewController {
  func setupView() {
    view.backgroundColor = .systemGray6
    addSubView()
    layout()
    setupAction()
  }
}

// MARK: - ADD VIEW
private extension ChangePasswordViewController {
  func addSubView() {
    view.addSubview(animation)
    view.addSubview(oldPasswordTextField)
    view.addSubview(newPasswordTextField)
    view.addSubview(confirmPasswordTextField)
  }
}

// MARK: - LAYOUT
private extension ChangePasswordViewController {
  func layout() {
    NSLayoutConstraint.activate([
      animation.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
      animation.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
      animation.heightAnchor.constraint(equalTo: animation.widthAnchor),
      animation.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
    
    NSLayoutConstraint.activate([
      oldPasswordTextField.topAnchor.constraint(equalTo: animation.bottomAnchor, constant: 30),
      oldPasswordTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
      oldPasswordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
    
    NSLayoutConstraint.activate([
      newPasswordTextField.topAnchor.constraint(equalTo: oldPasswordTextField.bottomAnchor, constant: 30),
      newPasswordTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
      newPasswordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
    
    NSLayoutConstraint.activate([
      confirmPasswordTextField.topAnchor.constraint(equalTo: newPasswordTextField.bottomAnchor, constant: 30),
      confirmPasswordTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
      confirmPasswordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
  }
}

// MARK: - ACTION
private extension ChangePasswordViewController {
  func setupAction() {
    saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
  }
}

// MARK: - CATCH SETUP
private extension ChangePasswordViewController {
  @objc func saveButtonTapped() {
    print("Tapped")
  }
}

