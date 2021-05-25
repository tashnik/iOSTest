//
//  LoginViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
  
  /**
   * =========================================================================================
   * INSTRUCTIONS
   * =========================================================================================
   * 1) Make the UI look like it does in the mock-up.
   *
   * 2) Take email and password input from the user
   *
   * 3) Use the endpoint and paramters provided in LoginClient.m to perform the log in
   *
   * 4) Calculate how long the API call took in milliseconds
   *
   * 5) If the response is an error display the error in a UIAlertController
   *
   * 6) If the response is successful display the success message AND how long the API call took in milliseconds in a UIAlertController
   *
   * 7) When login is successful, tapping 'OK' in the UIAlertController should bring you back to the main menu.
   **/
  
  // MARK: - Properties
  private var client: LoginClient?
  
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  
  
  var email: String?
  var password: String?
  var emailLogins: [EmailLogin] = []
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Login"
    
    configureTextFields()
  }
  
  // MARK: - TextField Business
  func configureTextFields() {
    emailTextField.delegate = self
    emailTextField.setLeftPaddingPoints(24)
    passwordTextField.setLeftPaddingPoints(24)
  }
  
  func textFieldDidBeginEditing(_ textField: UITextField) {
    emailTextField.textColor = UIColor(displayP3Red: 27/255, green: 30/255, blue: 31/255, alpha: 1.0)
    passwordTextField.textColor = UIColor(displayP3Red: 27/255, green: 30/255, blue: 31/255, alpha: 1.0)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Actions
  @IBAction func backAction(_ sender: Any) {
    let mainMenuViewController = MenuViewController()
    self.navigationController?.pushViewController(mainMenuViewController, animated: true)
  }
  
  @IBAction func didPressLoginButton(_ sender: Any) {
    if let email = emailTextField.text, let password = passwordTextField.text {
      
      checkLogin(for: email, password: password)
    }
  }
  
  
  func checkLogin(for email: String, password: String) {
    
    
    NetworkManager.shared.getLogin(for: email, password: password) { [weak self] result, time in
      guard let self = self else { return }
      
      let executionTime = String(format: "%.2f", time * 1000)
      
      DispatchQueue.main.async {
        switch result {
        
        case .success(let emailLogins):
          self.emailLogins = emailLogins
          
          let alert = UIAlertController(title: "Success", message: "\(emailLogins[0].email) was successfsully logged in at \(executionTime) milliseconds", preferredStyle: UIAlertController.Style.alert)
          
          alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
          self.present(alert, animated: true, completion: nil)
          
        case .failure(let error):
          let alert = UIAlertController(title: "Failure", message: "\(error.rawValue) in \(executionTime) milliseconds", preferredStyle: UIAlertController.Style.alert)
          
          alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {_ in
            self.navigationController?.popToRootViewController(animated: true)
          }))
    
          self.present(alert, animated: true, completion: nil)
          
        }
      }
    }
  }
}



extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
