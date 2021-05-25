//
//  MenuViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class MenuViewController: UIViewController {
  
  /**
   * =========================================================================================
   * INSTRUCTIONS
   * =========================================================================================
   *
   * 1) UI must work on iOS phones of multiple sizes. Do not worry about iPads.
   *
   * 2) Use Autolayout to make sure all UI works for each resolution
   *
   * 3) Use this starter project as a base and build upon it. It is ok to remove some of the
   *    provided code if necessary. It is ok to add any classes. This is your project now!
   *
   * 4) Read the additional instructions comments throughout the codebase, they will guide you.
   *
   * 5) Please take care of the bug(s) we left for you in the project as well. Happy hunting!
   *
   * Thank you and Good luck. - Rapptr Labs
   * =========================================================================================
   */
  
  
  
  let newChatButton = ITChatButton()
  let newLoginButton = ITLoginButton()
  let newAnimationButton = ITAnimationButton()
  
  // MARK: - Outlets
  @IBOutlet weak var chatButton: UIButton!
  @IBOutlet weak var loginButton: UIButton!
  @IBOutlet weak var animationButton: UIButton!
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureNavigationBar()
    configureNewChatButton()
    configureNewLoginButton()
    configureNewAnimationButton()
  }
  
  
  func configureNavigationBar() {
    
    title = "Coding Tasks"
    navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    navigationController?.navigationBar.tintColor = UIColor.white
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    
    if #available(iOS 10.0, *) {
      navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 14/255, green: 92/255, blue: 137/255, alpha: 1.0)
    } else {
      // Fallback on earlier versions
    }
  }
  
  // MARK: - Actions
  @IBAction func didPressChatButton(_ sender: Any) {
    let chatViewController = ChatViewController()
    navigationController?.pushViewController(chatViewController, animated: true)
  }
  
  @IBAction func didPressLoginButton(_ sender: Any) {
    let loginViewController = LoginViewController()
    navigationController?.pushViewController(loginViewController, animated: true)
  }
  
  @IBAction func didPressAnimationButton(_ sender: Any) {
    let animationViewController = AnimationViewController()
    navigationController?.pushViewController(animationViewController, animated: true)
  }
  
  // MARK: - New Chat Button
  func configureNewChatButton() {
    
    view.addSubview(newChatButton)
    newChatButton.addTarget(self, action: #selector(pushChatViewController), for: .touchUpInside)
    
    if #available(iOS 11.0, *) {
      NSLayoutConstraint.activate([
        newChatButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 227),
        newChatButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
        newChatButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        newChatButton.heightAnchor.constraint(equalToConstant: 55)
      ])
    } else {
      // Fallback on earlier versions
    }
  }
  
  @objc func pushChatViewController() {
    
    let chatViewController = ChatViewController()
    navigationController?.pushViewController(chatViewController, animated: true)
  }
  
  
  // MARK: - New Login Button
  func configureNewLoginButton() {
    
    view.addSubview(newLoginButton)
    newLoginButton.addTarget(self, action: #selector(pushLoginViewController), for: .touchUpInside)
    
    if #available(iOS 11.0, *) {
      NSLayoutConstraint.activate([
        newLoginButton.topAnchor.constraint(equalTo: newChatButton.bottomAnchor, constant: 24),
        newLoginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
        newLoginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        newLoginButton.heightAnchor.constraint(equalToConstant: 55)
      ])
    } else {
      // Fallback on earlier versions
    }
  }
  
  @objc func pushLoginViewController() {
    
    let loginViewController = LoginViewController()
    navigationController?.pushViewController(loginViewController, animated: true)
  }
  
  // MARK: - New Animation Button
  func configureNewAnimationButton() {
    
    view.addSubview(newAnimationButton)
    newAnimationButton.addTarget(self, action: #selector(pushAnimationViewController), for: .touchUpInside)
    
    if #available(iOS 11.0, *) {
      NSLayoutConstraint.activate([
        newAnimationButton.topAnchor.constraint(equalTo: newLoginButton.bottomAnchor, constant: 24),
        newAnimationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
        newAnimationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        newAnimationButton.heightAnchor.constraint(equalToConstant: 55),
      ])
    } else {
      // Fallback on earlier versions
    }
  }
  
  @objc func pushAnimationViewController() {
    
    let animationViewController = AnimationViewController()
    navigationController?.pushViewController(animationViewController, animated: true)
  }
}
