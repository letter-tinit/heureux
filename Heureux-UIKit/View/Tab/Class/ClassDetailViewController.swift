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
    
    var config = UIButton.Configuration.filled()
    config.baseBackgroundColor = .colorPink.withAlphaComponent(0.5)
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
    button.layer.shadowOpacity = 0.3
    button.layer.shadowOffset = CGSize(width: 10, height: 10)
    
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let descriptionStack: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  
  private let descriptionLabel: UILabel = {
    let label = UILabel()
    label.text = "Description"
    label.textColor = .black
    label.font = .rounded(ofSize: 18, weight: .medium)
    return label
  }()
  
  private let descriptionEditingIcon: UIImageView = {
    let imageView = UIImageView(frame: .zero)
    let config = UIImage.SymbolConfiguration(weight: .semibold)
    imageView.image = UIImage(systemName: "square.and.pencil", withConfiguration: config)
    imageView.tintColor = .colorPink
    imageView.contentMode = .scaleAspectFit
    imageView.isUserInteractionEnabled = true
    return imageView
  }()
  
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
    view.backgroundColor = .systemGray5
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
    view.addSubview(descriptionStack)
    descriptionStack.spacing = 10
    descriptionStack.addArrangedSubview(descriptionLabel)
    descriptionStack.addArrangedSubview(descriptionEditingIcon)
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
      descriptionStack.topAnchor.constraint(equalTo: seeMembersButton.bottomAnchor, constant: 20),
      descriptionStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
    ])
    
    NSLayoutConstraint.activate([
      descriptionTextView.topAnchor.constraint(equalTo: descriptionStack.bottomAnchor, constant: 20),
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
    
    let gesture = UITapGestureRecognizer(target: self, action: #selector(editingTapped))
    descriptionEditingIcon.addGestureRecognizer(gesture)
    descriptionTextView.delegate = self
  }
}

// MARK: - CATCH ACTION
private extension ClassDetailViewController {
  @objc func seeMembersButtonTapped() {
    let classMembersViewController = ClassMemberViewController()
    let nav = UINavigationController(rootViewController: classMembersViewController)
    present(nav, animated: true)
  }
  
  @objc func editingTapped() {
    if descriptionTextView.isUserInteractionEnabled {
      descriptionTextView.isUserInteractionEnabled = false
      descriptionTextView.returnKeyType = .done
      changeEditingView(color: .colorPink, imageName: "square.and.pencil")
    } else {
      descriptionTextView.isUserInteractionEnabled = true
      changeEditingView(color: .systemGreen, imageName: "checkmark")
    }
  }
}

// MARK: - DATA SETUP
private extension ClassDetailViewController {
  func dataSetup() {
    if let description = currentClass.description {
      descriptionTextView.text = description
      descriptionTextView.textColor = .black
    } else {
      descriptionTextView.text = "No description"
      descriptionTextView.textColor = .systemGray4
    }
  }
}

extension ClassDetailViewController: UITextViewDelegate {
  func textViewDidBeginEditing(_ textView: UITextView) {
    if let description = currentClass.description {
      descriptionTextView.text = description
    } else {
      descriptionTextView.text = ""
      descriptionTextView.textColor = .black
    }
  }
}

// MARK: - HELPER
private extension ClassDetailViewController {
  func changeEditingView(color: UIColor, imageName: String) {
    let config = UIImage.SymbolConfiguration(weight: .semibold)
    descriptionEditingIcon.image = UIImage(systemName: imageName, withConfiguration: config)
    descriptionEditingIcon.tintColor = .colorPink
  }
}
