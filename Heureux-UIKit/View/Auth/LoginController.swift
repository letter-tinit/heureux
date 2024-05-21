//
//  ViewController.swift
//  Heureux-UIKit
//
//  Created by Treasure Letter on 18/05/2024.
//

import UIKit
import Lottie

class LoginController: UIViewController {
  
  // MARK: -  PRIVATE PROPERTY
  private let emailTextField = RegisterTextField(symbol: "envelope", placeholder: "Email")
  
  private let passwordTextField = PasswordTextField(symbol: "lock", placeholder: "Password")
  
  private let forgotPasswordButton = NoBackgroundButton(title: "Forgot password")
  
  private let loginButton = StrokeButton(title: "Login")
  
  private let divider = DividerView()
  
  private let loginWithGoogleButton = GoogleButton(title: "Login with Google")
  
  private let stack: UIStackView = {
    let stackView = UIStackView(frame: .zero)
    stackView.axis = .vertical
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  
  lazy var alternativeButton: UIButton = {
    let button = UIButton(frame: .zero)
    button.setTitle("Sign Up", for: .normal)
    button.setTitleColor(.blue, for: .normal)
    button.setTitleColor(.gray, for: .highlighted)
    button.titleLabel?.font = .rounded(ofSize: 14, weight: .semibold)
    button.contentMode = .scaleAspectFit
    return button
  }()
  
  lazy var alternative: UIStackView = TextButton(text: "Do not have an account?", button: alternativeButton)
  
  private let animation: LottieAnimationView = {
    let animationView: LottieAnimationView
    animationView = .init(name: "education")
    animationView.play()
    animationView.loopMode = .loop
    animationView.animationSpeed = 1.5
    animationView.contentMode = .scaleAspectFit
    animationView.translatesAutoresizingMaskIntoConstraints = false
    return animationView
  }()
  
  // MARK: - OVERRIDE METHOD
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
}

// MARK: - SETTING VIEW
private extension LoginController{
  func setupView() {
    view.backgroundColor = .systemBackground
    navigationItem.backButtonTitle = ""
    addSubView()
    
    setupLayout()
    setupAction()
  }
}

// MARK: - SETTING
private extension LoginController{
  func addSubView() {
    view.addSubview(animation)
    view.addSubview(emailTextField)
    view.addSubview(passwordTextField)
    view.addSubview(forgotPasswordButton)
    view.addSubview(stack)
    stack.addArrangedSubview(loginButton)
    stack.addArrangedSubview(divider)
    stack.addArrangedSubview(loginWithGoogleButton)
    stack.distribution = .equalCentering
    stack.alignment = .center
    view.addSubview(alternative)
  }
}

private extension LoginController{
  // MARK: - Layout
  func setupLayout() {
    // MARK: - LAYOUT ANIMATION
    NSLayoutConstraint.activate([
      animation.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      animation.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
      animation.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
      animation.heightAnchor.constraint(equalTo: animation.widthAnchor)
    ])
    
    // MARK: - LAYOUT EMAIL TEXT FIELD
    emailTextField.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      emailTextField.topAnchor.constraint(equalTo: animation.bottomAnchor, constant: 20),
      emailTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
    ])
    
    // MARK: - LAYOUT PASSWORD TEXT FIELD
    NSLayoutConstraint.activate([
      passwordTextField.centerXAnchor.constraint(equalTo: emailTextField.centerXAnchor),
      passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
      passwordTextField.widthAnchor.constraint(equalTo: emailTextField.widthAnchor)
    ])
    
    NSLayoutConstraint.activate([
      forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
      forgotPasswordButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
    ])
    
    NSLayoutConstraint.activate([
      alternative.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      alternative.heightAnchor.constraint(equalToConstant: 30),
      alternative.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
    
    NSLayoutConstraint.activate([
      stack.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 30),
      stack.bottomAnchor.constraint(equalTo: alternative.topAnchor, constant: 5),
      stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      stack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
      loginButton.widthAnchor.constraint(equalTo: stack.widthAnchor),
      divider.widthAnchor.constraint(equalTo: stack.widthAnchor, multiplier: 0.8),
      divider.heightAnchor.constraint(equalToConstant: 2),
      loginWithGoogleButton.widthAnchor.constraint(equalTo: stack.widthAnchor, multiplier: 0.8),
    ])
    
  }
  
  // MARK: - SETUP ACTION
  func setupAction() {
    forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
    loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    alternativeButton.addTarget(self, action: #selector(alternativeButtonTapped), for: .touchUpInside)
  }
  
  @objc
  func forgotPasswordButtonTapped() {
    print("Tapped")
  }
  
  @objc
  func loginButtonTapped() {
    print("Tapped")
  }
  
  @objc
  func alternativeButtonTapped() {
    navigationController?.pushViewController(SignUpViewController(), animated: true)
  }
  
}
