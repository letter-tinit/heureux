//
//  ClassMemberCollectionViewCell.swift
//  Heureux-UIKit
//
//  Created by Treasure Letter on 22/05/2024.
//

import UIKit

class ClassMemberTableViewCell: UITableViewCell {
  static let identifier: String = "ClassMemberCollectionViewCell"
  
  lazy var avatarImage: UIImage = {
    let image = UIImage(named: "sample-avatar")
    return image ?? UIImage()
  }()
  
  lazy var avatarImageView = CircleImage(image: avatarImage, size: 40)
  
  lazy var nameLabel: UILabel = {
    let label = UILabel()
    label.text = "Nguyen Trung Tin"
    label.font = .rounded(ofSize: 18, weight: .medium)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  lazy var mailLabel: UILabel = {
    let label = UILabel()
    label.text = "tinntse162163@fpt.edu.vn"
    label.font = .rounded(ofSize: 16, weight: .regular)
    label.textColor = .systemGray
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    viewSetup()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 10))
  }
  
  private func viewSetup() {
    contentView.addSubview(avatarImageView)
    contentView.addSubview(nameLabel)
    contentView.addSubview(mailLabel)

    NSLayoutConstraint.activate([
      avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      avatarImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
    ])
    
    NSLayoutConstraint.activate([
      nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
      nameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor, constant: -10)
    ])
    
    NSLayoutConstraint.activate([
      mailLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
      mailLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor, constant: 10)
    ])
  }
  
  func config(user: User) {
    nameLabel.text = user.name
    mailLabel.text = user.mail
    avatarImage = UIImage(named: user.avatar) ?? UIImage()
  }
}
