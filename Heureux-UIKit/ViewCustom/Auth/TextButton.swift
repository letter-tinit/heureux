//
//  TextButton.swift
//  Heureux-UIKit
//
//  Created by Treasure Letter on 18/05/2024.
//

import UIKit

class TextButton: UIStackView {  
  init(text: String, button: UIButton) {
    super.init(frame: .zero)
    setupTextButton(text: text, button: button)
  }
  
  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  private func setupTextButton(text: String, button: UIButton) {
    let textLabel: UILabel = {
      let textLabel = UILabel()
      textLabel.text = text
      textLabel.font = .rounded(ofSize: 14, weight: .medium)
      return textLabel
    }()
    
    translatesAutoresizingMaskIntoConstraints = false
    distribution = .equalCentering
    axis = .horizontal
    alignment = .center
    addArrangedSubview(textLabel)
    addArrangedSubview(button)
    spacing = 4
  }
}
