//
//  GoogleButton.swift
//  Heureux-UIKit
//
//  Created by Treasure Letter on 18/05/2024.
//

import UIKit

class GoogleButton: UIButton {
  
  override var isHighlighted: Bool {
    didSet {
      if isHighlighted {
        self.alpha = 0.7
      } else {
        self.alpha = 1.0
      }
    }
  }
  
  lazy var stack: UIStackView = {
    let stackView = UIStackView(frame: .zero)
    stackView.axis = .horizontal
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  
  lazy var buttonTitle: UILabel = {
    let label = UILabel()
    return label
  }()
  
  lazy var logo: UIImageView = {
    let imageView = UIImageView(frame: .zero)
    imageView.image = UIImage(named: "google")
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()
  
  init(title: String) {
    super.init(frame: .zero)
    setupButton(title: title)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  private func setupButton(title: String) {
    layer.borderWidth = 2
    layer.borderColor = UIColor.black.cgColor
    layer.cornerRadius = 20
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowRadius = 7
    layer.shadowOpacity = 0.4
    layer.shadowOffset = CGSize(width: 5, height: 5)
    
    heightAnchor.constraint(equalToConstant: 40).isActive = true
    
    addSubview(stack)
    stack.distribution = .fill
    stack.alignment = .center
    stack.spacing = 10
    
    buttonTitle.text = title
    buttonTitle.textAlignment = .center
    buttonTitle.textColor = .black
    buttonTitle.font = .rounded(ofSize: 18, weight: .medium)
    stack.addArrangedSubview(logo)
    stack.addArrangedSubview(buttonTitle)
    stack.isUserInteractionEnabled = false
    
    NSLayoutConstraint.activate([
      stack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
      stack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      stack.topAnchor.constraint(equalTo: self.topAnchor),
      stack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
      stack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
      stack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
    ])
    
    NSLayoutConstraint.activate([
      logo.heightAnchor.constraint(equalTo: stack.heightAnchor, multiplier: 0.6),
      logo.widthAnchor.constraint(equalTo: logo.heightAnchor),
    ])
    isUserInteractionEnabled = true
    self.translatesAutoresizingMaskIntoConstraints = false
  }
}
