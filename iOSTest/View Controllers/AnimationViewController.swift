//
//  AnimationViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit
import AVFoundation

class AnimationViewController: UIViewController {
  
  /**
   * =========================================================================================
   * INSTRUCTIONS
   * =========================================================================================
   * 1) Make the UI look like it does in the mock-up.
   *
   * 2) Logo should fade out or fade in when the user hits the Fade In or Fade Out button
   *
   * 3) User should be able to drag the logo around the screen with his/her fingers
   *
   * 4) Add a bonus to make yourself stick out. Music, color, fireworks, explosions!!! Have Swift experience? Why not write the Animation
   *    section in Swfit to show off your skills. Anything your heart desires!
   *
   **/
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Animation"
    
    addPanGesture(view: logoImage)
    
    logoViewOrigin = logoImage.frame.origin
    
    configureMolten()
    configureAnimations()
  }
  
  let animator = UIViewPropertyAnimator(duration: 1.0, curve: .linear)
  var timer: Timer?
  var audioPlayer: AVAudioPlayer?
  
  var fadeButtonPressed = false
  var logoViewOrigin: CGPoint!
  
  @IBOutlet weak var fadeButton: UIButton!
  @IBOutlet weak var logoImage: UIImageView!
  @IBOutlet weak var moltenImage: UIImageView!
  
  // MARK: - Actions
  @IBAction func backAction(_ sender: Any) {
    let mainMenuViewController = MenuViewController()
    self.navigationController?.pushViewController(mainMenuViewController, animated: true)
  }
  
  @IBAction func didPressFade(_ sender: Any) {
    fadeButtonPressed.toggle()
    
    let pathToSound = Bundle.main.path(forResource: "explosion", ofType: "wav")!
    let url = URL(fileURLWithPath: pathToSound)

    do {
      audioPlayer = try AVAudioPlayer(contentsOf: url)
      audioPlayer?.play()
    } catch {
      print("Didn't play sound")
    }
    
    if fadeButtonPressed {
      UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
          self.logoImage.alpha = 0.0
      }, completion: nil)
      fadeButton.setTitle("FADE IN", for: .normal)
      
      configureTimerUp()
    } else {
      UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
          self.logoImage.alpha = 1.0
      }, completion: nil)
      fadeButton.setTitle("FADE OUT", for: .normal)
    }
  }
  
  
  func addPanGesture(view: UIView) {
    
    let pan = UIPanGestureRecognizer(target: self, action: #selector(AnimationViewController.handlePan(sender:)))
    view.addGestureRecognizer(pan)
  }
  
  
  @objc func handlePan(sender: UIPanGestureRecognizer) {
    
    let logoView = sender.view
    let translation = sender.translation(in: view)
    
    switch sender.state {
    
    case .began, .changed:
      logoView!.center = CGPoint(x: (logoView!.center.x) + translation.x, y: ((logoView?.center.y)!) + translation.y)
      
      sender.setTranslation(CGPoint.zero, in: view)
      
     
    case .ended:
      UIView.animate(withDuration: 0.5) {
        self.logoImage.frame.origin = self.logoViewOrigin
      }
      
      let pathToSound = Bundle.main.path(forResource: "D", ofType: "wav")!
      let url = URL(fileURLWithPath: pathToSound)
      
      do {
        audioPlayer = try AVAudioPlayer(contentsOf: url)
        audioPlayer?.play()
      } catch {
        print("Didn't play sound")
      }
    case .possible:
      break
    case .cancelled:
      break
    case .failed:
      break
    @unknown default:
      break
    }
  }
  
  func configureMolten() {
    moltenImage.alpha = 0.0
    moltenImage.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
  }
  
  func configureAnimations() {
    animator.addAnimations {
      self.moltenImage.alpha = 1.0
      self.moltenImage.transform = CGAffineTransform(scaleX: 6, y: 6)
    }
  }
  
  func configureTimerUp() {
    timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
  }
  
  @objc func runTimedCode() {
    if animator.fractionComplete < 1 {
      animator.fractionComplete += 0.05
    } else {
      animator.stopAnimation(true)
      animator.finishAnimation(at: .current)
    }
  }
}
