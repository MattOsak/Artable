//
//  RegisterVC.swift
//  Artable
//
//  Created by Matt Osak on 2019-07-13.
//  Copyright © 2019 Matt Osak. All rights reserved.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {

    // Outlets
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var confirmPassTxt: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var passCheckImg: UIImageView!
    @IBOutlet weak var confirmPassCheckImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTxt.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        confirmPassTxt.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
      
    }
    @objc func textFieldDidChange(_ textfield: UITextField) {
        guard let passTxt = passwordTxt else {
           return
        }
        if passTxt == passwordTxt {
            passCheckImg.isHighlighted = false
            confirmPassCheckImg.isHidden = false
        } else {
            passCheckImg.isHighlighted = true
            confirmPassCheckImg.isHidden = true
            confirmPassTxt.text = " "
        }
        
    }

  @IBAction func registerClicked(_ sender: Any) {
    
    guard let email = emailTxt.text , email.isNotEmpty ,
    let username = usernameTxt.text ,
    username.isNotEmpty ,
        let password = passwordTxt.text, password.isNotEmpty else {
            simpleAlert(title: "Error", msg: "Please fill out all fields.")
            return
    }
    
    guard let confirmedPassword = confirmPassTxt.text, confirmedPassword.isNotEmpty else {
        simpleAlert(title: "Eorror", msg: "Passwords do not match.")
        return
        
    }
    
    activityIndicator.startAnimating()
    
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                if let error = error {
                    debugPrint(error)
                 //   Auth.auth().handleFireAuthError(error: error, vc: self)
                    return
                }
                self.activityIndicator.stopAnimating()
    
    }
    
    
    }
}
