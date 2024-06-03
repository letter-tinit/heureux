//
//  PasswordTextField.swift
//  Heureux-UIKit
//
//  Created by Treasure Letter on 18/05/2024.
//

import UIKit

// MARK: - PASSWORD TEXTFIELD
final class PasswordTextField: UITextField {
  
  // MARK: - PRIVATE PROPERTY
  
  private let padding = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)
  private let leftPadding = 20
  private let rightPadding = 20
  
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
    let width = leftPadding
    let x = bounds.minX + 10
    let y = (bounds.height - height) / 2
    return CGRect(x: x, y: y, width: CGFloat(width), height: height)
  }
  
  override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
    let height = bounds.height
    let width = rightPadding
    let x = bounds.maxX - CGFloat(width) - 10 // Adjusting the calculation for the right view
    let y = (bounds.height - height) / 2
    return CGRect(x: x, y: y, width: CGFloat(width), height: height)
  }
  
  // MARK: - PRIVATE METHOD
  private func setupTextField(symbol: String, placeholder: String) {
    textColor = .white
    font = .rounded(ofSize: 18, weight: .medium)
    
    self.isSecureTextEntry = true
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
    
    // MARK: - LEFT VIEW
    
    let leftImageView = makeImageView(symbol: symbol)
    
    leftView = leftImageView
    leftViewMode = .always
    
    // MARK: - RIGHT VIEW
    
    let rightImageView = makeImageView(symbol: "eye.slash")
    
    rightView = rightImageView
    rightViewMode = .always
    
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(togglePasswordVisibility))
    rightImageView.addGestureRecognizer(tapGesture)
    rightImageView.isUserInteractionEnabled = true
    
    heightAnchor.constraint(equalToConstant: 60).isActive = true
    
    self.translatesAutoresizingMaskIntoConstraints = false
  }
  
  
  private func makeImageView(symbol: String) -> UIImageView {
    let imageView = UIImageView(frame: .zero)
    let config = UIImage.SymbolConfiguration(weight: .heavy)
    imageView.image = UIImage(systemName: symbol, withConfiguration: config)
    imageView.contentMode = .center
    return imageView
  }
  
  @objc private func togglePasswordVisibility() {
    isSecureTextEntry.toggle()
    
    let rightImageView = rightView as? UIImageView
    let newSymbol = isSecureTextEntry ? "eye.slash" : "eye"
    let config = UIImage.SymbolConfiguration(weight: .heavy)
    rightImageView?.image = UIImage(systemName: newSymbol, withConfiguration: config)
    rightImageView?.tintColor = isSecureTextEntry ? .systemGray5 : .systemBackground
  }
}
