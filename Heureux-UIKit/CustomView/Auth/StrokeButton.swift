//
//  CustomButton.swift
//  Heureux-UIKit
//
//  Created by Treasure Letter on 18/05/2024.
//

import UIKit

class StrokeButton: UIButton {
  init(title: String) {
    super.init(frame: .zero)
    setupButton(title: title)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  private func setupButton(title: String) {
    setTitle(title, for: .normal)
    setTitleColor(.colorPink, for: .normal)
    setTitleColor(.systemGray5, for: .highlighted)
    titleLabel?.font = .rounded(ofSize: 26, weight: .bold)
    
    layer.borderWidth = 2
    layer.borderColor = UIColor.colorPink.cgColor
    layer.cornerRadius = 10
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowRadius = 9
    layer.shadowOpacity = 0.3
    layer.shadowOffset = CGSize(width: 5, height: 5)
    
    self.translatesAutoresizingMaskIntoConstraints = false
    heightAnchor.constraint(equalToConstant: 60).isActive = true
  }
}
