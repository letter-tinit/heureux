//
//  CircleImage.swift
//  Heureux-UIKit
//
//  Created by Treasure Letter on 19/05/2024.
//

import UIKit

class CircleImage: UIImageView {
  init(image: UIImage, size: CGFloat) {
    super.init(image: image)
    setupView(size: size)
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  func setupView(size: CGFloat) {
    self.translatesAutoresizingMaskIntoConstraints = false
    self.clipsToBounds = true
    self.layer.masksToBounds = true
    self.layer.masksToBounds = true
    self.layer.cornerRadius = size / 2
//    self.layer.borderWidth = 1
//    self.layer.borderColor = UIColor.systemGray6.cgColor
    
    self.contentMode = .scaleAspectFill
    
    NSLayoutConstraint.activate([
      self.widthAnchor.constraint(equalToConstant: size),
      self.heightAnchor.constraint(equalToConstant: size),
    ])
  }
}
