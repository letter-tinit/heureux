//
//  NoBackgroundButton.swift
//  Heureux-UIKit
//
//  Created by Treasure Letter on 18/05/2024.
//

import UIKit

class NoBackgroundButton: UIButton {
  init(title: String) {
    super.init(frame: .zero)
    setupButton(title: title)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  private func setupButton(title: String) {
    self.translatesAutoresizingMaskIntoConstraints = false
    setTitle(title, for: .normal)
    setTitleColor(.blue, for: .normal)
    setTitleColor(.systemGray5, for: .highlighted)
    titleLabel?.font = .rounded(ofSize: 14, weight: .medium)
    
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowRadius = 5
    layer.shadowOpacity = 0.4
    layer.shadowOffset = CGSize(width: 5, height: 5)
    
    backgroundColor = .clear
    
    self.translatesAutoresizingMaskIntoConstraints = false
  }
}
