//
//  CustomNavigationTitle.swift
//  Heureux-UIKit
//
//  Created by Treasure Letter on 19/05/2024.
//

import UIKit

class CustomNavigationTitle: UILabel {
  init(title: String) {
    super.init(frame: .zero)
    setupView(title: title)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupView(title: String) {
    self.text = title
    self.textColor = .black
    self.font = .rounded(ofSize: 24, weight: .semibold)
  }
}
