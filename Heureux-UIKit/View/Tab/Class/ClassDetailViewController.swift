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
  
  private let seeMembersButtonImage: UIImage = UIImage(systemName: "person.2") ?? UIImage()
  
  lazy var seeMembersButton = ImageButton(image: seeMembersButtonImage, title: "See Members", color: .systemRed)
  
  private let descriptionLabel: UILabel = {
    let label = UILabel()
    label.text = "Description"
    label.textColor = .black
    label.font = .rounded(ofSize: 18, weight: .medium)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let addDescriptionImage: UIImage = UIImage(systemName: "plus") ?? UIImage()
  
  lazy var addDescriptionButton = ImageButton(image: addDescriptionImage, title: "Add description", color: .systemBlue)

  private let descriptionTextView: UITextView = {
    let textView = UITextView()
    textView.font = .rounded(ofSize: 16, weight: .regular)
    textView.backgroundColor = .white
    textView.layer.cornerRadius = 10
    textView.insetsLayoutMarginsFromSafeArea = true
    textView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    textView.isEditable = true
    textView.isUserInteractionEnabled = false
    textView.translatesAutoresizingMaskIntoConstraints = false
    return textView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupNav()
    setupView()
    setupAction()
  }
}

// MARK: - NAVIGATION SETUP
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
    dataSetup()
  }
}

// MARK: - VIEW ADDITION
private extension ClassDetailViewController {
  func addSubView() {
    view.addSubview(animation)
    view.addSubview(seeMembersButton)
    view.addSubview(descriptionLabel)
    view.addSubview(addDescriptionButton)
    view.addSubview(descriptionTextView)
  }
}

// MARK: - LAYOUT
private extension ClassDetailViewController {
  func layout() {
    NSLayoutConstraint.activate([
      animation.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      animation.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      animation.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
      animation.heightAnchor.constraint(equalTo: animation.widthAnchor, multiplier: 2/3)
    ])
    
    NSLayoutConstraint.activate([
      seeMembersButton.topAnchor.constraint(equalTo: animation.bottomAnchor, constant: 10),
      seeMembersButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
    ])
    
    NSLayoutConstraint.activate([
      descriptionLabel.topAnchor.constraint(equalTo: seeMembersButton.bottomAnchor, constant: 20),
      descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
    ])
    
    NSLayoutConstraint.activate([
      addDescriptionButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
      addDescriptionButton.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor)
    ])
    
    NSLayoutConstraint.activate([
      descriptionTextView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
      descriptionTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
      descriptionTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      descriptionTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
    ])
  }
}

// MARK: - ACTION
private extension ClassDetailViewController {
  func setupAction() {
    seeMembersButton.addTarget(self, action: #selector(seeMembersButtonTapped), for: .touchUpInside)
    addDescriptionButton.addTarget(self, action: #selector(addDescriptionButtonTapped), for: .touchUpInside)
  }
}

// MARK: - CATCH ACTION
private extension ClassDetailViewController {
  @objc func seeMembersButtonTapped() {
    let classMembersViewController = ClassMemberViewController()
    let nav = UINavigationController(rootViewController: classMembersViewController)
    present(nav, animated: true)
  }
  
  @objc func addDescriptionButtonTapped() {
    let alertController = UIAlertController(title: "Add Description", message: nil, preferredStyle: .alert)
    alertController.addTextField { textField in
      textField.placeholder = "Description"
      textField.font = .rounded(ofSize: 16, weight: .medium)
      textField.tintColor = .systemBlue
      textField.textColor = .black
    }
    
    let addAction = UIAlertAction(title: "Create", style: .default) { _ in
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

// MARK: - DATA SETUP
private extension ClassDetailViewController {
  func dataSetup() {
    if let description = currentClass.description {
      descriptionTextView.isHidden = false
      descriptionTextView.text = description
      addDescriptionButton.isHidden = true
    } else {
      descriptionTextView.isHidden = true
      addDescriptionButton.isHidden = false
    }
  }
}

extension ClassDetailViewController: UITextViewDelegate {
}

// MARK: - HELPER
private extension ClassDetailViewController {
}
