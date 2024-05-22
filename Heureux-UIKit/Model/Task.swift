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
    Class(name: "PRN909", color: .orange, status: .finished, description: "This is some description"),
    Class(name: "EXE909", color: .blue, status: .finished, description: nil),
    Class(name: "SWD909", color: .green, status: .inProgress, description: nil)
  ]
  
  static var users: [User] = [
    User(name: "Alice Johnson", mail: "alice.johnson@example.com", avatar: "sample-avatar"),
    User(name: "Bob Smith", mail: "bob.smith@example.com", avatar: "sample-avatar"),
    User(name: "Charlie Brown", mail: "charlie.brown@example.com", avatar: "sample-avatar"),
    User(name: "David Williams", mail: "david.williams@example.com", avatar: "sample-avatar"),
    User(name: "Ella Davis", mail: "ella.davis@example.com", avatar: "sample-avatar"),
    User(name: "Frank Miller", mail: "frank.miller@example.com", avatar: "sample-avatar"),
    User(name: "Grace Wilson", mail: "grace.wilson@example.com", avatar: "sample-avatar"),
    User(name: "Hannah Moore", mail: "hannah.moore@example.com", avatar: "sample-avatar"),
    User(name: "Ian Taylor", mail: "ian.taylor@example.com", avatar: "sample-avatar"),
    User(name: "Jane Anderson", mail: "jane.anderson@example.com", avatar: "sample-avatar"),
    User(name: "Kevin Thomas", mail: "kevin.thomas@example.com", avatar: "sample-avatar"),
    User(name: "Laura Jackson", mail: "laura.jackson@example.com", avatar: "sample-avatar"),
    User(name: "Mike White", mail: "mike.white@example.com", avatar: "sample-avatar"),
    User(name: "Nina Harris", mail: "nina.harris@example.com", avatar: "sample-avatar"),
    User(name: "Oscar Martin", mail: "oscar.martin@example.com", avatar: "sample-avatar")
]
}
