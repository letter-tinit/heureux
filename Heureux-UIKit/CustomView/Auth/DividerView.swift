//
//  DividerView.swift
//  Heureux-UIKit
//
//  Created by Treasure Letter on 18/05/2024.
//

import UIKit

class DividerView: UIView {
  private let borderText: UIView = {
    let view = UIView(frame: .zero)
    view.backgroundColor = .green
    return view
  }()
  
  private let label: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.text = "Or"
    label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
    label.textAlignment = .center
    return label
  }()
  
  
  init() {
    super.init(frame: .zero)
    setupDivider()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupDivider() {
    self.translatesAutoresizingMaskIntoConstraints = false
    self.backgroundColor = .green
    
    
    addSubview(borderText)
    borderText.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      borderText.centerXAnchor.constraint(equalTo: centerXAnchor),
      borderText.centerYAnchor.constraint(equalTo: centerYAnchor),
      borderText.widthAnchor.constraint(equalToConstant: 40),
      borderText.heightAnchor.constraint(equalToConstant: 25),
    ])
    borderText.layer.cornerRadius = 8
    
    addSubview(label)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .rounded(ofSize: 16, weight: .heavy)
    
    NSLayoutConstraint.activate([
      label.centerXAnchor.constraint(equalTo: centerXAnchor),
      label.centerYAnchor.constraint(equalTo: centerYAnchor)
    ])
    
  }
}
