//
//  ChatTableViewCell.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class ChatTableViewCell: UITableViewCell {
  
  /**
   * =========================================================================================
   * INSTRUCTIONS
   * =========================================================================================
   * 1) Setup cell to match mockup
   *
   * 2) Include user's avatar image
   **/
  
  // MARK: - Outlets
  @IBOutlet weak var header: UILabel!
  @IBOutlet weak var body: PaddingLabel!
  @IBOutlet weak var avatar: UIImageView!
  
  // MARK: - Lifecycle
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  // MARK: - Public
  func setCellData(message: UserMessage) {
    
    header.text = message.name
    body.text = message.message
    body.padding(8, 8, 8, 8)
    body.layer.borderColor = UIColor.darkGray.cgColor
    body.layer.borderWidth = 0.5
    body.layer.cornerRadius = 12
    if #available(iOS 13.0, *) {
      body.layer.backgroundColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1.0)
    } else {
      // Fallback on earlier versions
    }
   
    
    NetworkManager.shared.downloadImage(fromURLString: message.avatar_url) { returnedImage in
      if let avatarImage = returnedImage {
        DispatchQueue.main.async {
          let roundedImage = avatarImage.withRoundedCorners(radius: 50)
          
          self.avatar.image = roundedImage
        }
      } else {
        print("No Image returned")
      }
    }
  }
}


extension UIImage {
       // image with rounded corners
       public func withRoundedCorners(radius: CGFloat? = nil) -> UIImage? {
           let maxRadius = min(size.width, size.height) / 2
           let cornerRadius: CGFloat
           if let radius = radius, radius > 0 && radius <= maxRadius {
               cornerRadius = radius
           } else {
               cornerRadius = maxRadius
           }
           UIGraphicsBeginImageContextWithOptions(size, false, scale)
           let rect = CGRect(origin: .zero, size: size)
           UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).addClip()
           draw(in: rect)
           let image = UIGraphicsGetImageFromCurrentImageContext()
           UIGraphicsEndImageContext()
           return image
       }
   }


class PaddingLabel: UILabel {
    
    var insets = UIEdgeInsets.zero
    
    /// Добавляет отступы
    func padding(_ top: CGFloat, _ bottom: CGFloat, _ left: CGFloat, _ right: CGFloat) {
        self.frame = CGRect(x: 0, y: 0, width: self.frame.width + left + right, height: self.frame.height + top + bottom)
        insets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        get {
            var contentSize = super.intrinsicContentSize
            contentSize.height += insets.top + insets.bottom
            contentSize.width += insets.left + insets.right
            return contentSize
        }
    }
}
