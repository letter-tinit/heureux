//
//  Task.swift
//  Heureux-UIKit
//
//  Created by Treasure Letter on 20/05/2024.
//

import UIKit

enum TaskProgress: String {
  case completed = "Completed"
  case overdue = "Overdue"
  case working = "Working"
  case upcoming = "Upcoming"
}


extension TaskProgress {
  var color: UIColor {
    switch self {
    case .completed:
      return .systemGreen
    case .overdue:
      return .systemRed
    case .working:
      return .systemOrange
    case .upcoming:
      return .systemPurple
    }
  }
  
  var symbol: String {
    switch self {
    case .completed:
      return "checkmark.circle.fill"
    case .overdue:
      return "xmark.circle.fill"
    case .working:
      return "slowmo"
    case .upcoming:
      return "timer"
    }
  }
}

struct Task {
  let name: String
  let status: TaskProgress
  let deadline: Date?
  let description: String?
}

struct Data {
  static var tasks = [
    Task(name: "Task 1", status: .completed, deadline: .now, description: "This is Task 1"),
    Task(name: "Task 2", status: .overdue, deadline: .now, description: "This is Task 2"),
    Task(name: "Task 3", status: .upcoming, deadline: .now, description: "This is Task 3"),
    Task(name: "Task 5", status: .completed, deadline: .now, description: "This is Task 5"),
    Task(name: "Task 4", status: .working, deadline: nil, description: "This is Task 4")
  ]
  
  static var classes = [
    Class(name: "PRN909", color: .orange, status: .finished),
    Class(name: "EXE909", color: .blue, status: .finished),
    Class(name: "SWD909", color: .green, status: .inProgress),
    Class(name: "PRN909", color: .orange, status: .finished),
    Class(name: "EXE909", color: .blue, status: .finished),
    Class(name: "SWD909", color: .green, status: .inProgress),
    Class(name: "PRN909", color: .orange, status: .finished),
    Class(name: "EXE909", color: .blue, status: .finished),
    Class(name: "SWD909", color: .green, status: .inProgress),
    Class(name: "PRN909", color: .orange, status: .finished),
    Class(name: "EXE909", color: .blue, status: .finished),
    Class(name: "SWD909", color: .green, status: .inProgress),
  ]
}
