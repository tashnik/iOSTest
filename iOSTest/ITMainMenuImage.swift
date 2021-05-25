//
//  ITMainMenuImage.swift
//  iOSTest
//
//  Created by Tashnik on 5/20/21.
//  Copyright © 2021 D&ATechnologies. All rights reserved.
//

import UIKit

class ITMainMenuImage: UIImageView {

  override init(frame: CGRect) {
    super.init(frame: frame)
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  init(image: UIImage) {
    super.init(frame: .zero)
    
    self.image = image
    
    configure()
  }
  
  private func configure() {
    
    layer.cornerRadius = 10
    clipsToBounds = true
    translatesAutoresizingMaskIntoConstraints = false
  }

}
