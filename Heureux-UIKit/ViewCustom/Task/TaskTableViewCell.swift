//
//  TaskTableViewCell.swift
//  Heureux-UIKit
//
//  Created by Treasure Letter on 20/05/2024.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
  static let identifier: String = "TaskTableViewCell"
  
  let stack: UIStackView = {
    let stackView = UIStackView(frame: .zero)
    stackView.axis = .horizontal
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  
  let icon: UIImageView = {
    let imageView = UIImageView(frame: .zero)
    imageView.image = UIImage(systemName: "checkmark.circle.fill")
    imageView.contentMode = .scaleAspectFit
    imageView.tintColor = .white
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let taskStatus: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.font = .rounded(ofSize: 18, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let taskName: UILabel = {
    let label = UILabel()
    label.text = "Test"
    label.textColor = .black
    label.font = .rounded(ofSize: 22, weight: .medium)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let deadlineStack: UIStackView = {
    let stackView = UIStackView(frame: .zero)
    stackView.axis = .horizontal
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  
  let deadlineSymbol: UIImageView = {
    let imageView = UIImageView(frame: .zero)
    imageView.image = UIImage(systemName: "clock.badge.exclamationmark")
    imageView.contentMode = .scaleAspectFit
    imageView.tintColor = .systemRed
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let deadlineLabel: UILabel = {
    let label = UILabel()
    label.textColor = .red
    label.font = .rounded(ofSize: 14, weight: .medium)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.alpha = 0.4
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
      self.alpha = 1
    }
    super.touchesBegan(touches, with: event)
    self.superview?.superview?.touchesBegan(touches, with: event)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
  }
  
  private func setupView() {
    contentView.addSubview(stack)
    contentView.backgroundColor = .colorPink.withAlphaComponent(0.4)
    contentView.layer.cornerRadius = 10
    contentView.clipsToBounds = true
    
    stack.backgroundColor = .green
    stack.distribution = .fillProportionally
    stack.spacing = 10
    stack.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    stack.isLayoutMarginsRelativeArrangement = true
    stack.addArrangedSubview(icon)
    stack.addArrangedSubview(taskStatus)
    
    NSLayoutConstraint.activate([
      self.stack.widthAnchor.constraint(equalTo: contentView.widthAnchor),
      self.stack.heightAnchor.constraint(equalToConstant: 45),
    ])
    
        NSLayoutConstraint.activate([
      self.icon.widthAnchor.constraint(equalToConstant: 30)
    ])
    
    contentView.layer.shadowColor = UIColor.black.cgColor
    contentView.layer.shadowRadius = 7
    contentView.layer.shadowOpacity = 0.4
    contentView.layer.shadowOffset = CGSize(width: 10, height: 10)
    
    contentView.addSubview(taskName)
    NSLayoutConstraint.activate([
      taskName.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 20),
      taskName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
    ])
    
        contentView.addSubview(deadlineStack)
    deadlineStack.distribution = .fillProportionally
    deadlineStack.spacing = 10
    deadlineStack.isLayoutMarginsRelativeArrangement = true
    deadlineStack.addArrangedSubview(deadlineSymbol)
    deadlineStack.addArrangedSubview(deadlineLabel)

    
    NSLayoutConstraint.activate([
      deadlineStack.topAnchor.constraint(equalTo: taskName.bottomAnchor, constant: 20),
      deadlineStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
      deadlineStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
      deadlineSymbol.widthAnchor.constraint(equalToConstant: 20),
      deadlineSymbol.heightAnchor.constraint(equalToConstant: 20)
    ])
  }
  
  func config(task: Task) {
    self.taskStatus.text = task.status.rawValue
    self.stack.backgroundColor = task.status.color
    self.icon.image = UIImage(systemName: task.status.symbol)
    self.taskName.text = task.name
    
    if let deadline = task.deadline {
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "MMM d, h:mm a"
      
      deadlineLabel.text = dateFormatter.string(from: deadline)
    } else {
      deadlineLabel.text = "Not set"
    }
    
  }
}
