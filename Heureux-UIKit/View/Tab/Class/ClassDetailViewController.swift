//
//  ClassDetailViewController.swift
//  Heureux-UIKit
//
//  Created by Treasure Letter on 21/05/2024.
//

import UIKit
import Lottie

class ClassDetailViewController: UIViewController {
  var currentClass: Class
  
  init(currentClass: Class) {
    self.currentClass = currentClass
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - CREATE UI
  
  private let animation: LottieAnimationView = {
    let animationView: LottieAnimationView
    animationView = .init(name: "teaching")
    animationView.play()
    animationView.loopMode = .loop
    animationView.animationSpeed = 1.5
    animationView.contentMode = .scaleAspectFit
    animationView.translatesAutoresizingMaskIntoConstraints = false
    return animationView
  }()
  
  private let seeMembersButton: UIButton = {
    let button = UIButton(frame: .zero)
    
    var config = UIButton.Configuration.tinted()
    config.baseBackgroundColor = .colorPink
    config.image = UIImage(systemName: "person.2")
    config.imagePlacement = .leading
    config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(scale: .small)
    config.imagePadding = 4
    config.baseForegroundColor = .red
    
    let attributes: [NSAttributedString.Key: Any] = [
      .font: UIFont.rounded(ofSize: 14, weight: .regular)
    ]
    let attributedTitle = NSAttributedString(string: "See Members", attributes: attributes)
    config.attributedTitle = AttributedString(attributedTitle)
    
    button.configuration = config
    
    button.layer.shadowColor = UIColor.black.cgColor
    button.layer.shadowRadius = 7
    button.layer.shadowOpacity = 0.4
    button.layer.shadowOffset = CGSize(width: 10, height: 10)
    
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupNav()
    setupView()
    setupAction()
  }
}

// MARK: - SETUP NAVIGATION
private extension ClassDetailViewController {
  func setupNav() {
    navigationItem.title = currentClass.name
    let maskAction = UIAction(title: "Mark as " + currentClass.status.splitStatus, image: UIImage(systemName: "bookmark.fill")) { _ in
    }
    
    let deleteAction = UIAction(title: "Remove class", image: UIImage(systemName: "trash"), attributes: .destructive) { _ in
    }
    
    let optionsMenu = UIMenu(children: [maskAction, deleteAction])
    let optionsButton = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), menu: optionsMenu)
    
    navigationItem.rightBarButtonItem = optionsButton
  }
}

// MARK: - VIEW SETTUP
private extension ClassDetailViewController {
  func setupView() {
    view.backgroundColor = .systemGray6
    addSubView()
    layout()
  }
}

// MARK: - VIEW ADDITION
private extension ClassDetailViewController {
  func addSubView() {
    view.addSubview(animation)
    view.addSubview(seeMembersButton)
  }
}

// MARK: - LAYOUT
private extension ClassDetailViewController {
  func layout() {
    NSLayoutConstraint.activate([
      animation.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      animation.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      animation.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
      animation.heightAnchor.constraint(equalTo: animation.widthAnchor, multiplier: 2/3),
    ])
    
    NSLayoutConstraint.activate([
      seeMembersButton.topAnchor.constraint(equalTo: animation.bottomAnchor, constant: 20),
      seeMembersButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
    ])
  }
}

// MARK: - ACTION
private extension ClassDetailViewController {
  func setupAction() {
    seeMembersButton.addTarget(self, action: #selector(seeMembersButtonTapped), for: .touchUpInside)
  }
}

// MARK: - CATCH ACTION
private extension ClassDetailViewController {
  @objc func seeMembersButtonTapped() {
    let classMembersViewController = ClassMemberViewController()
    let nav = UINavigationController(rootViewController: classMembersViewController)
    present(nav, animated: true)
  }
}
