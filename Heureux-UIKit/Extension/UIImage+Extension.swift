//
//  UIImage+Extension.swift
//  Heureux-UIKit
//
//  Created by Treasure Letter on 19/05/2024.
//

import UIKit

extension UIImage {
  func circularImage(size: CGSize) -> UIImage? {
    let rect = CGRect(origin: .zero, size: size)
    
    UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
    let context = UIGraphicsGetCurrentContext()
    
    context?.addEllipse(in: rect)
    context?.clip()
    
    self.draw(in: rect)
    
    let circularImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return circularImage
  }
  
  func resized(to targetSize: CGSize) -> UIImage {
    return UIGraphicsImageRenderer(size: targetSize).image { _ in
      draw(in: CGRect(origin: .zero, size: targetSize))
    }
  }
  
  public convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
    let rect = CGRect(origin: .zero, size: size)
    UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
    color.setFill()
    UIRectFill(rect)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    guard let cgImage = image?.cgImage else { return nil }
    self.init(cgImage: cgImage)
  }
}
