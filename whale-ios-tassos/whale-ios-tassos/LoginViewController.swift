//
//  LoginViewController.swift
//  whale-ios-tassos
//
//  Created by Tassos Lambrou on 3/22/17.
//  Copyright © 2017 SsosSoft. All rights reserved.
//

import Foundation
import UIKit
import Security
import KeychainSwift
import Alamofire

class LoginViewController: ViewController {
  
  @IBOutlet weak var emailTextField: UITextField!
  
  @IBOutlet weak var passwordTextField: UITextField!
  
  @IBOutlet weak var loginButton: UIButton!
  
  @IBOutlet weak var credentialLabel: UILabel!
  @IBAction func verify(_ sender: Any) {
    
    let email = emailTextField.text
    let password = passwordTextField.text
    
    
    
    let parameters: Parameters = ["email": email, "password": password]
    
    Alamofire.request("https://whale2-elixir.herokuapp.com/api/v1/sessions", method: .post, parameters: parameters) { response in
      switch response.result {
      case .success(let data):
        print("Successful login network call")
      case .failure:
        print("Network call for login failure")
      }
    }
    
    if emailTextField.text == email && passwordTextField.text == password {
      
      credentialLabel.textColor = UIColor.green
      credentialLabel.text = "The Credentials Were Correct"
      print("\n\ncredentials were correct\n\n")
      emailTextField.resignFirstResponder()
      passwordTextField.resignFirstResponder()
    
    } else {
      credentialLabel.textColor = UIColor.red
      credentialLabel.text = "The Credentials Were Incorrect"
      print("\n\ncredentials were incorrect\n\n")
      emailTextField.resignFirstResponder()
      passwordTextField.resignFirstResponder()
    }
    
  }
}
