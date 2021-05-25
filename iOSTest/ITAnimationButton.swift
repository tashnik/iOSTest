//
//  ITAnimationButton.swift
//  iOSTest
//
//  Created by Tashnik on 5/20/21.
//  Copyright © 2021 D&ATechnologies. All rights reserved.
//

import UIKit

class ITAnimationButton: UIButton {

  let animationImageView = ITMainMenuImage(image: UIImage(named: "ic_animation")!)
  let animationLabel = ITMainMenuLabel(textAlignment: .left, fontSize: 16, text: "ANIMATION")

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
    addSubview(animationImageView)
    
    NSLayoutConstraint.activate([
      animationImageView.leadingAnchor.constraint(equalTo: imageView!.leadingAnchor, constant: 22),
      animationImageView.heightAnchor.constraint(equalToConstant: 24),
      animationImageView.widthAnchor.constraint(equalToConstant: 24),
      animationImageView.topAnchor.constraint(equalTo: imageView!.topAnchor, constant: 15.5)
    ])
  }
  
  func addLabel() {
    addSubview(animationLabel)
    
    NSLayoutConstraint.activate([
      animationLabel.leadingAnchor.constraint(equalTo: animationImageView.trailingAnchor, constant: 16),
      animationLabel.centerYAnchor.constraint(equalTo: animationImageView.centerYAnchor)
    ])
  }
  
  
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
