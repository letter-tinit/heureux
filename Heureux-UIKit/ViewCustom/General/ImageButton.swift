//
//  ImageButtom.swift
//  Heureux-UIKit
//
//  Created by Treasure Letter on 03/06/2024.
//

import UIKit

class ImageButton: UIButton {
  init(image: UIImage, title: String, color: UIColor) {
    super.init(frame: .zero)
    viewSetup(image: image, title: title, color: color)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func viewSetup(image: UIImage, title: String, color: UIColor) {
    var config = UIButton.Configuration.tinted()
    config.baseBackgroundColor = color.withAlphaComponent(0.5)
    config.baseForegroundColor = color
    config.image = image
    config.imagePlacement = .leading
    config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(scale: .small)
    config.imagePadding = 4
    
    let attributes: [NSAttributedString.Key: Any] = [
      .font: UIFont.rounded(ofSize: 14, weight: .regular)
    ]
    let attributedTitle = NSAttributedString(string: title, attributes: attributes)
    config.attributedTitle = AttributedString(attributedTitle)
    
    self.configuration = config
    
    self.layer.shadowColor = UIColor.black.cgColor
    self.layer.shadowRadius = 7
    self.layer.shadowOpacity = 0.4
    self.layer.shadowOffset = CGSize(width: 15, height: 15)
    
    self.translatesAutoresizingMaskIntoConstraints = false
  }
}
