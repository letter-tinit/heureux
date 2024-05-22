//
//  UIColor+Extension.swift
//  Heureux-UIKit
//
//  Created by Treasure Letter on 22/05/2024.
//

import UIKit

extension UIColor {
  static func random() -> UIColor {
    let randomRed = CGFloat.random(in: 0...1)
    let randomGreen = CGFloat.random(in: 0...1)
    let randomBlue = CGFloat.random(in: 0...1)
    
    return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
  }
}
