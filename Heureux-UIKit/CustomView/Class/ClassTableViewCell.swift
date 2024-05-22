//
//  ClassTableViewCell.swift
//  Heureux-UIKit
//
//  Created by Treasure Letter on 21/05/2024.
//

import UIKit

class ClassTableViewCell : UITableViewCell {
  static let identifier: String = "ClassTableViewCell"
  
  let stack: UIStackView = {
    let stackView = UIStackView(frame: .zero)
    stackView.axis = .horizontal
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  
  let icon: UIImageView = {
    let imageView = UIImageView(frame: .zero)
    imageView.image = UIImage(systemName: "book.closed.fill")
    imageView.contentMode = .scaleAspectFit
    imageView.tintColor = .systemBrown
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let className: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.font = .rounded(ofSize: 20, weight: .bold)
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
    
    contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20))
  }
  
  private func setupView() {
    contentView.addSubview(stack)
    contentView.backgroundColor = .colorPink.withAlphaComponent(0.3)
    contentView.layer.cornerRadius = 20
    contentView.clipsToBounds = true
    contentView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMinYCorner]
    
    stack.backgroundColor = .clear
    stack.distribution = .fillProportionally
    stack.spacing = 10
    stack.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    stack.isLayoutMarginsRelativeArrangement = true
    stack.addArrangedSubview(icon)
    stack.addArrangedSubview(className)
    
    NSLayoutConstraint.activate([
      self.stack.widthAnchor.constraint(equalTo: contentView.widthAnchor),
      self.stack.heightAnchor.constraint(equalTo: contentView.heightAnchor)
    ])
    
    NSLayoutConstraint.activate([
      self.icon.widthAnchor.constraint(equalToConstant: 30)
    ])
    
    contentView.layer.shadowColor = UIColor.black.cgColor
    contentView.layer.shadowRadius = 7
    contentView.layer.shadowOpacity = 0.4
    contentView.layer.shadowOffset = CGSize(width: 10, height: 10)
  }
  
  func config(item: Class) {
    className.text = item.name
    contentView.backgroundColor = item.color.withAlphaComponent(0.3)
  }
}
