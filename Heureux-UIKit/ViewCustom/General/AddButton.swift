//
//  AddButton.swift
//  Heureux-UIKit
//
//  Created by Treasure Letter on 21/05/2024.
//

import UIKit

class AddButton: UIButton {
  init(color: UIColor) {
    super.init(frame: .zero)
    setupView(color: color)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupView(color: UIColor) {
    let config = UIImage.SymbolConfiguration(font: .rounded(ofSize: 30, weight: .bold))
    self.setImage(UIImage(systemName: "plus", withConfiguration: config), for: .normal)
    self.backgroundColor = color.withAlphaComponent(0.6)
    self.layer.shadowColor = UIColor.black.cgColor
    self.layer.shadowRadius = 7
    self.layer.shadowOpacity = 0.4
    self.layer.shadowOffset = CGSize(width: 10, height: 10)
    self.layer.cornerRadius = 30
    self.tintColor = .white
    self.translatesAutoresizingMaskIntoConstraints = false
    self.widthAnchor.constraint(equalToConstant: 60).isActive = true
    self.heightAnchor.constraint(equalToConstant: 60).isActive = true
  }
}
