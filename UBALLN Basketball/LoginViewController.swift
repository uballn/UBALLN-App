//
//  LoginViewController.swift
//  UBALLN Basketball
//
//  Created by Jeremy Gaston on 5/10/17.
//  Copyright © 2017 UBALLN. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    //variables
        
    //outlets
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var loginBtn: UIButton!
    @IBOutlet var loginFB: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailField.layer.cornerRadius = 2
        passwordField.layer.cornerRadius = 2
        loginBtn.layer.cornerRadius = 2
        loginFB.layer.cornerRadius = 2
        loginFB.layer.borderWidth = 1.5
        loginFB.layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.10).cgColor
        
        var placeHolder1 = NSMutableAttributedString()
        let Name = "Email Address"

        placeHolder1 = NSMutableAttributedString(string: Name, attributes: [NSFontAttributeName : UIFont(name: "Gotham", size: 12.0)!])
        
        placeHolder1.addAttribute(NSForegroundColorAttributeName, value: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.35), range: NSRange(location:0,length:Name.characters.count))
        
        emailField.attributedPlaceholder = placeHolder1
        
        let paddingView = UIView(frame: CGRect(x:0, y:0, width:15, height:self.emailField.frame.height))
            emailField.leftView = paddingView
            emailField.leftViewMode = UITextFieldViewMode.always
        
        var placeHolder2 = NSMutableAttributedString()
        let Name2 = "Password"
        
        placeHolder2 = NSMutableAttributedString(string: Name2, attributes: [NSFontAttributeName : UIFont(name: "Gotham", size: 12.0)!])
        
        placeHolder2.addAttribute(NSForegroundColorAttributeName, value: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.35), range: NSRange(location:0,length:Name2.characters.count))
        
        passwordField.attributedPlaceholder = placeHolder2
        
        let paddingView2 = UIView(frame: CGRect(x:0, y:0, width:15, height:self.passwordField.frame.height))
        passwordField.leftView = paddingView2
        passwordField.leftViewMode = UITextFieldViewMode.always

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //actions
    @IBAction func back(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func loginClicked(_ sender: Any) {
        
        guard let email = emailField.text,
        email != "",
        let password = passwordField.text,
        password != ""
            else {
                AlertController.showAlert(self, title: "Forget Something?", message: "Your email or password is missing")
                return
        }
        
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            guard error == nil else {
                AlertController.showAlert(self, title: "Error", message: error!.localizedDescription)
                return
            }
            guard let user = user else { return }
            print(user.email ?? "MISSING EMAIL")
            print(user.uid)
            
            self.performSegue(withIdentifier: "home", sender: nil)
        })
    }
    
    //func
}
