//
//  SignUpViewController.swift
//  Heureux-UIKit
//
//  Created by Treasure Letter on 18/05/2024.
//

import UIKit
import Lottie

class SignUpViewController: UIViewController {
  // MARK: - Init view
  private let animation: LottieAnimationView = {
    let animationView: LottieAnimationView
    animationView = .init(name: "join")
    animationView.play()
    animationView.loopMode = .loop
    animationView.animationSpeed = 1.5
    animationView.contentMode = .scaleAspectFit
    animationView.translatesAutoresizingMaskIntoConstraints = false
    return animationView
  }()
  
  private let nameTextField = RegisterTextField(symbol: "person", placeholder: "Name")
  private let emailTextField = RegisterTextField(symbol: "envelope", placeholder: "Email")
  private let passwordTextField = RegisterTextField(symbol: "lock", placeholder: "Password")
  
  private let signUpButton = StrokeButton(title: "Sign Up")
  
  private let divider = DividerView()
  
  private let signupWithGoogleButton = GoogleButton(title: "Sign Up with Google")
  
  private let stack: UIStackView = {
    let stackView = UIStackView(frame: .zero)
    stackView.axis = .vertical
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  
  lazy var alternativeButton: UIButton = {
    let button = UIButton(frame: .zero)
    button.setTitle("Login", for: .normal)
    button.setTitleColor(.blue, for: .normal)
    button.setTitleColor(.gray, for: .highlighted)
    button.titleLabel?.font = .rounded(ofSize: 14, weight: .semibold)
    button.contentMode = .scaleAspectFit
    return button
  }()
  
  lazy var alternative: UIStackView = TextButton(text: "Already have an account", button: alternativeButton)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
}

// MARK: - SETTING
private extension SignUpViewController {
  func setupView() {
    view.backgroundColor = .systemBackground
    navigationItem.backButtonTitle = ""
    addSubView()
    setupLayout()
    setupAction()
    
  }
}

// MARK: - SETTING VIEW
private extension SignUpViewController {
  func addSubView() {
    view.addSubview(animation)
    view.addSubview(nameTextField)
    view.addSubview(emailTextField)
    view.addSubview(passwordTextField)
    view.addSubview(stack)
    stack.addArrangedSubview(signUpButton)
    stack.addArrangedSubview(divider)
    stack.addArrangedSubview(signupWithGoogleButton)
    stack.distribution = .equalCentering
    stack.alignment = .center
    view.addSubview(alternative)
  }
}

// MARK: - LAYOUT
private extension SignUpViewController {
  func setupLayout() {
    NSLayoutConstraint.activate([
      animation.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      animation.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
      animation.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
      animation.heightAnchor.constraint(equalTo: animation.widthAnchor)
    ])
    
    NSLayoutConstraint.activate([
      nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      nameTextField.topAnchor.constraint(equalTo: animation.bottomAnchor, constant: 20),
      nameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
    ])
    
    NSLayoutConstraint.activate([
      emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
      emailTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
    ])
    
    NSLayoutConstraint.activate([
      passwordTextField.centerXAnchor.constraint(equalTo: emailTextField.centerXAnchor),
      passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
      passwordTextField.widthAnchor.constraint(equalTo: emailTextField.widthAnchor)
    ])
    
    NSLayoutConstraint.activate([
      alternative.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      alternative.heightAnchor.constraint(equalToConstant: 30),
      alternative.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
    
    NSLayoutConstraint.activate([
      stack.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
      stack.bottomAnchor.constraint(equalTo: alternative.topAnchor, constant: 5),
      stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      stack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
      signUpButton.widthAnchor.constraint(equalTo: stack.widthAnchor),
      divider.widthAnchor.constraint(equalTo: stack.widthAnchor, multiplier: 0.8),
      divider.heightAnchor.constraint(equalToConstant: 2),
      signupWithGoogleButton.widthAnchor.constraint(equalTo: stack.widthAnchor, multiplier: 0.8),
    ])
  }
  
  // MARK: - SETUP ACTION
  func setupAction() {
    alternativeButton.addTarget(self, action: #selector(alternativeButtonTapped), for: .touchUpInside)
  }
  
  // MARK: - CATCH ACTION
  @objc
  func alternativeButtonTapped() {
    navigationController?.pushViewController(LoginController(), animated: true)
  }
}
