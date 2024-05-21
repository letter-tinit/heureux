//
//  ProfileRow.swift
//  Heureux-UIKit
//
//  Created by Treasure Letter on 19/05/2024.
//

import UIKit

class ProfileRow: UIStackView {
  
  init(icon: String, title: String) {
    super.init(frame: .zero)
    setupView(icon: icon, title: title)
  }
  
  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - OVERRIDE METHOD
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.alpha = 0.2
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
      self.alpha = 1
    }
    super.touchesBegan(touches, with: event)
    self.superview?.superview?.touchesBegan(touches, with: event)
  }
  
  private func setupView(icon: String, title: String) {
    self.translatesAutoresizingMaskIntoConstraints = false
    self.isUserInteractionEnabled = true
    
    let imageView: UIImageView = {
      let imageView = UIImageView(frame: .zero)
      imageView.image = UIImage(systemName: icon)
      imageView.contentMode = .scaleAspectFit
      imageView.translatesAutoresizingMaskIntoConstraints = false
      imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
      imageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
      return imageView
    }()
    
    let titleLabel: UILabel = {
      let label = UILabel()
      label.text = title
      label.font = .rounded(ofSize: 16, weight: .medium)
      return label
    }()
    
    self.alignment = .center
    self.spacing = 20
    
    self.addArrangedSubview(imageView)
    self.addArrangedSubview(titleLabel)
    
    NSLayoutConstraint.activate([
      self.heightAnchor.constraint(equalToConstant: 40)
    ])
  }
}
