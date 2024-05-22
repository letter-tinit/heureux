//
//  Class.swift
//  Heureux-UIKit
//
//  Created by Treasure Letter on 21/05/2024.
//

import UIKit

enum ClassStatus: String {
  case inProgress = "In Progress"
  case finished = "Finished"
}

enum ClassColor: String {
  case green = "Green"
  case blue = "Blue"
  case orange = "Orange"
}

extension ClassColor {
  var color: UIColor {
    switch self {
    case .green:
      return .systemGreen
    case .blue:
      return .systemBlue
    case .orange:
      return .systemOrange
    }
  }
}

struct Class {
  let name: String
  let color: UIColor
  let status: ClassStatus
}
