//
//  ProfileRowContainer.swift
//  Heureux-UIKit
//
//  Created by Treasure Letter on 19/05/2024.
//

import UIKit

class ProfileRowContainer: UIStackView {
  init() {
    super.init(frame: .zero)
    self.axis = .vertical
    setupView()
  }
  
  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupView() {
    self.translatesAutoresizingMaskIntoConstraints = false
    self.backgroundColor = .colorPink.withAlphaComponent(0.3)
    self.layer.cornerRadius = 10
    self.spacing = 10
    self.layoutMargins = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    self.isLayoutMarginsRelativeArrangement = true
    self.layer.shadowColor = UIColor.black.cgColor
    self.layer.shadowRadius = 7
    self.layer.shadowOpacity = 0.4
    self.layer.shadowOffset = CGSize(width: 15, height: 15)
    
    NSLayoutConstraint.activate([
      self.heightAnchor.constraint(greaterThanOrEqualToConstant: 20),
    ])
  }
}
