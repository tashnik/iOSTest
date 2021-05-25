//
//  ITButton.swift
//  iOSTest
//
//  Created by Tashnik on 5/20/21.
//  Copyright © 2021 D&ATechnologies. All rights reserved.
//

import UIKit

class ITChatButton: UIButton {
  
  let chatImageView = ITMainMenuImage(image: UIImage(named: "ic_chat")!)
  let chatLabel = ITMainMenuLabel(textAlignment: .left, fontSize: 16, text: "CHAT")

  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  init() {
    
    super.init(frame: .zero)
    self.backgroundColor = UIColor.white.withAlphaComponent(0.8)
    configure()
  }
  
  private func configure() {
    
    layer.cornerRadius = 10
    setTitleColor(.black, for: .normal)
    titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    translatesAutoresizingMaskIntoConstraints = false
    
    addImage()
    addLabel()
  }
  
  func addImage() {
    addSubview(chatImageView)
    
    NSLayoutConstraint.activate([
      chatImageView.leadingAnchor.constraint(equalTo: imageView!.leadingAnchor, constant: 22),
      chatImageView.heightAnchor.constraint(equalToConstant: 24),
      chatImageView.widthAnchor.constraint(equalToConstant: 24),
      chatImageView.topAnchor.constraint(equalTo: imageView!.topAnchor, constant: 15.5)
    ])
  }
  
  func addLabel() {
    addSubview(chatLabel)
    
    NSLayoutConstraint.activate([
      chatLabel.leadingAnchor.constraint(equalTo: chatImageView.trailingAnchor, constant: 16),
      chatLabel.centerYAnchor.constraint(equalTo: chatImageView.centerYAnchor)
    ])
  }
  
//  func set(backgroundColor: UIColor, title: String) {
//
//    self.backgroundColor = backgroundColor
//    setTitle(title, for: .normal)
//  }
//
  
  
//  func configureNewChatButton() {
//
//    view.addSubview(newChatButton)
//    newChatButton.addTarget(self, action: #selector(pushChatViewController), for: .touchUpInside)
//
//    if #available(iOS 11.0, *) {
//      NSLayoutConstraint.activate([
//        newChatButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 227),
//        newChatButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
//        newChatButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
//        newChatButton.heightAnchor.constraint(equalToConstant: 55)
//      ])
//    } else {
//      // Fallback on earlier versions
//    }
//  }

}
