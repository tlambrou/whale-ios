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
import KeychainAccess

class LoginViewController: ViewController {
  
  @IBOutlet weak var emailTextField: UITextField!
  
  @IBOutlet weak var passwordTextField: UITextField!
  
  @IBOutlet weak var loginButton: UIButton!
  
  @IBOutlet weak var credentialLabel: UILabel!
  @IBAction func verify(_ sender: Any) {
    
    let email = emailTextField.text
    let password = passwordTextField.text
    
    
    let parameters: Parameters? = ["email": email! as String, "password": password! as String]
    //let headers: HTTPHeaders? = {"Authorization"}
    
    let url = "https://whale2-elixir.herokuapp.com/api/v1/sessions"
    
    Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
      switch response.result {
      case .success(let data):
        print("Successful login network call")
        self.credentialLabel.textColor = UIColor.green
        self.credentialLabel.text = "The Credentials Were Correct"
        print("\n\ncredentials were correct\n\n")
        self.emailTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
      case .failure:
        print("Network call for login failure")
        self.credentialLabel.textColor = UIColor.red
        self.credentialLabel.text = "The Credentials Were Incorrect"
        print("\n\ncredentials were incorrect\n\n")
        self.emailTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
      }
    }
    
  }
}
