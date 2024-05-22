//
//  ProfileViewController.swift
//  Heureux-UIKit
//
//  Created by Treasure Letter on 18/05/2024.
//

import UIKit

class ProfileViewController: UIViewController {
  
  // MARK: - CREATE UI COMPONENTS
  lazy var scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.isScrollEnabled = true
    scrollView.showsVerticalScrollIndicator = false
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    return scrollView
  }()
  
  lazy var image: UIImage = {
    let image = UIImage(named: "sample-avatar")
    return image ?? UIImage()
  }()
  
  lazy var circleImage = CircleImage(image: image, size: 120)
  
  private let nameLabel: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.font = .rounded(ofSize: 19, weight: .medium)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let emailLabel: UILabel = {
    let label = UILabel()
    label.textColor = .systemGray
    label.font = .rounded(ofSize: 16, weight: .regular)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let logoutButton: UIButton = {
    let button = UIButton(frame: .zero)
    
    var config = UIButton.Configuration.tinted()
    config.baseBackgroundColor = .colorPink
    config.image = UIImage(systemName: "rectangle.portrait.and.arrow.right")
    config.imagePlacement = .leading
    config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(scale: .small)
    config.imagePadding = 4
    config.baseForegroundColor = .red
    
    let attributes: [NSAttributedString.Key: Any] = [
      .font: UIFont.rounded(ofSize: 14, weight: .regular)
    ]
    let attributedTitle = NSAttributedString(string: "Logout", attributes: attributes)
    config.attributedTitle = AttributedString(attributedTitle)
    
    button.configuration = config
    
    button.layer.shadowColor = UIColor.black.cgColor
    button.layer.shadowRadius = 7
    button.layer.shadowOpacity = 0.4
    button.layer.shadowOffset = CGSize(width: 15, height: 15)
    
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let contentView = ProfileRowContainer()
  
  lazy var changePassword = ProfileRow(icon: "lock.shield", title: "Change password")
  
  private let divider = SimpleDivider(color: .systemGray5, height: 1)
  
  lazy var aboutus = ProfileRow(icon: "person.3", title: "About Us")
  
  private let divider2 = SimpleDivider(color: .systemGray5, height: 1)
  
  lazy var frequentlyAsked = ProfileRow(icon: "questionmark.circle", title: "Frequently asked questions")
  
  private let divider3 = SimpleDivider(color: .systemGray5, height: 1)
  
  lazy var customerCare = ProfileRow(icon: "stethoscope", title: "Customer care")
  
  private let divider4 = SimpleDivider(color: .systemGray5, height: 1)
  
  lazy var errorReport = ProfileRow(icon: "exclamationmark.triangle", title: "Error report")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    navConfig()
  }
  
  private func navConfig() {
    let titleLabel = CustomNavigationTitle(title: "Profile")
    
    navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
    
    
    let config = UIImage.SymbolConfiguration(weight: .bold)
    let image = UIImage(systemName: "square.and.pencil", withConfiguration: config)
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(editProfileTapped))
  }
}

// MARK: - SETTUPVIEW
private extension ProfileViewController {
  func setupView() {
    view.backgroundColor = .systemGray6
    addSubView()
    setupLayout()
    setupData()
    setupAction()
  }
}

private extension ProfileViewController {
  // MARK: - ADD VIEW
  func addSubView() {
    view.addSubview(scrollView)
    scrollView.addSubview(circleImage)
    scrollView.addSubview(nameLabel)
    scrollView.addSubview(emailLabel)
    scrollView.addSubview(logoutButton)
    scrollView.addSubview(contentView)
    contentView.addArrangedSubview(changePassword)
    contentView.addArrangedSubview(divider)
    contentView.addArrangedSubview(aboutus)
    contentView.addArrangedSubview(divider2)
    contentView.addArrangedSubview(frequentlyAsked)
    contentView.addArrangedSubview(divider3)
    contentView.addArrangedSubview(customerCare)
    contentView.addArrangedSubview(divider4)
    contentView.addArrangedSubview(errorReport)
  }
  
  
  // MARK: - SETUP DATA
  func setupData() {
    nameLabel.text = "Lee Sin Chibi"
    emailLabel.text = "letter.tinit@gmail.com"
  }
}


// MARK: - LAYOUT
private extension ProfileViewController {
  func setupLayout() {
    NSLayoutConstraint.activate([
      scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      scrollView.topAnchor.constraint(equalTo: view.topAnchor),
      scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
    
    
    NSLayoutConstraint.activate([
      circleImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
      circleImage.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
    ])
    
    NSLayoutConstraint.activate([
      nameLabel.topAnchor.constraint(equalTo: circleImage.bottomAnchor, constant: 15),
      nameLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
    ])
    
    NSLayoutConstraint.activate([
      emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
      emailLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
    ])
    
    NSLayoutConstraint.activate([
      logoutButton.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 20),
      logoutButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
    ])
    
    NSLayoutConstraint.activate([
      contentView.topAnchor.constraint(equalTo: logoutButton.bottomAnchor, constant: 35),
      contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9),
      contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
      contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -50)
    ])
    
    scrollView.contentSize = CGSize(width: view.frame.width, height: contentView.frame.maxY + 50)
  }
}

private extension ProfileViewController {
  // MARK: - SETUP ACTION
  func setupAction() {
    logoutButton.addTarget(self, action: #selector(logoutButtonTaped), for: .touchUpInside)
    let changePasswordTap = UITapGestureRecognizer(target: self, action: #selector(changePasswordTapped))
    changePassword.addGestureRecognizer(changePasswordTap)
    
    let errorReportTap = UITapGestureRecognizer(target: self, action: #selector(errorReportTapped))
    errorReport.addGestureRecognizer(errorReportTap)
  }
  
  
  // MARK: - CATCH ACTION
  @objc func logoutButtonTaped() {
    let alertController = UIAlertController(title: "Warning", message: "Are you sure you want to log out?", preferredStyle: .alert)
    
    let okAction = UIAlertAction(title: "Confirm", style: .default) { _ in
    }
    
    let deleteAction = UIAlertAction(title: "Cancel", style: .destructive) { _ in
      
    }
    
    alertController.addAction(deleteAction)
    alertController.addAction(okAction)
    
    present(alertController, animated: true, completion: nil)
  }
  
  @objc func changePasswordTapped() {
    let changePasswordViewController = ChangePasswordViewController()
    navigationController?.pushViewController(changePasswordViewController, animated: true)
  }
  
  @objc func errorReportTapped() {
    let alertController = UIAlertController(title: "Enter error description", message: nil, preferredStyle: .alert)
    alertController.addTextField { textField in
      textField.placeholder = "Description"
    }
    
    let submitAction = UIAlertAction(title: "Submit", style: .default) { _ in
      guard let text = alertController.textFields![0].text else {
        return
      }
      print(text)
    }
    
    let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
    
    alertController.addAction(cancelAction)
    alertController.addAction(submitAction)
    
    present(alertController, animated: true, completion: nil)
  }
  
  @objc func editProfileTapped() {
    let editProfileViewContoller = ProfileEditViewController()
    navigationController?.pushViewController(editProfileViewContoller, animated: true)
  }
}
