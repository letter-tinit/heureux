//
//  RegisterTextField.swift
//  Heureux-UIKit
//
//  Created by Treasure Letter on 18/05/2024.
//

import UIKit

// MARK: - REGISTER TEXTFIELD
final class RegisterTextField: UITextField {
  
  // MARK: - PRIVATE PROPERTY
  
  private let padding = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)
  
  // MARK: - INIT
  init(symbol: String, placeholder: String) {
    super.init(frame: .zero)
    setupTextField(symbol: symbol, placeholder: placeholder)
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - OVERRIDE METHOD
  override func textRect(forBounds bounds: CGRect) -> CGRect {
    bounds.inset(by: padding)
  }
  
  override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
    bounds.inset(by: padding)
  }
  
  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    bounds.inset(by: padding)
    
  }
  
  override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
    let height = bounds.height
    let width = 20
    let x = bounds.minX + 10
    let y = (bounds.height - height) / 2
    return CGRect(x: x, y: y, width: CGFloat(width), height: height)
  }
  
  // MARK: - PRIVATE METHOD
  private func setupTextField(symbol: String, placeholder: String) {
    textColor = .white
    font = .rounded(ofSize: 18, weight: .medium)
    
    self.autocapitalizationType = .none
    
    layer.cornerRadius = 10
    layer.backgroundColor = UIColor.colorPink.cgColor
    
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowRadius = 7
    layer.shadowOpacity = 0.4
    layer.shadowOffset = CGSize(width: 15, height: 15)
    
    attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray5])
    
    font = .boldSystemFont(ofSize: 18)
    
    tintColor = .white
    
    let leftImageView: UIImageView = {
      let imageView = UIImageView(frame: .zero)
      let config = UIImage.SymbolConfiguration(weight: .heavy)
      imageView.image = UIImage(systemName: symbol, withConfiguration: config)
      imageView.contentMode = .center
      return imageView
    }()
    
    leftView = leftImageView
    leftViewMode = .always
    
    heightAnchor.constraint(equalToConstant: 60).isActive = true
    
    self.translatesAutoresizingMaskIntoConstraints = false
  }
  
}
