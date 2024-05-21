//
//  SimpleDivider.swift
//  Heureux-UIKit
//
//  Created by Treasure Letter on 19/05/2024.
//

import UIKit

class SimpleDivider: UIView {
  init(color: UIColor, height: CGFloat) {
    super.init(frame: .zero)
    setupView(color: color, height: height)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
        
  private func setupView(color: UIColor, height: CGFloat) {
    self.translatesAutoresizingMaskIntoConstraints = true
    self.backgroundColor = color
    self.heightAnchor.constraint(equalToConstant: height).isActive = true
    self.widthAnchor.constraint(equalTo: super.widthAnchor, multiplier: 1).isActive = true
  }
}
