//
//  SignupViewController.swift
//  UBALLN Basketball
//
//  Created by Jeremy Gaston on 5/10/17.
//  Copyright © 2017 UBALLN. All rights reserved.
//

import UIKit
import Firebase

class SignupViewController: UIViewController {
    
    
    @IBOutlet var joinFB: UIButton!
    @IBOutlet var nameField: UITextField!
    @IBOutlet var lastField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var createCTA: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        joinFB.layer.cornerRadius = 2
        nameField.layer.cornerRadius = 2
        lastField.layer.cornerRadius = 2
        emailField.layer.cornerRadius = 2
        passwordField.layer.cornerRadius = 2
        createCTA.layer.cornerRadius = 2
        
        var placeHolder1 = NSMutableAttributedString()
        let Name1 = "Email Address"
        
        placeHolder1 = NSMutableAttributedString(string: Name1, attributes: [NSFontAttributeName : UIFont(name: "Gotham", size: 14.0)!])
        
        placeHolder1.addAttribute(NSForegroundColorAttributeName, value: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.35), range: NSRange(location:0,length:Name1.characters.count))
        
        emailField.attributedPlaceholder = placeHolder1
        
        let paddingView1 = UIView(frame: CGRect(x:0, y:0, width:15, height:self.emailField.frame.height))
        emailField.leftView = paddingView1
        emailField.leftViewMode = UITextFieldViewMode.always
        
        var placeHolder2 = NSMutableAttributedString()
        let Name2 = "Password"
        
        placeHolder2 = NSMutableAttributedString(string: Name2, attributes: [NSFontAttributeName : UIFont(name: "Gotham", size: 14.0)!])
        
        placeHolder2.addAttribute(NSForegroundColorAttributeName, value: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.35), range: NSRange(location:0,length:Name2.characters.count))
        
        passwordField.attributedPlaceholder = placeHolder2
        
        let paddingView2 = UIView(frame: CGRect(x:0, y:0, width:15, height:self.passwordField.frame.height))
        passwordField.leftView = paddingView2
        passwordField.leftViewMode = UITextFieldViewMode.always
        
        var placeHolder3 = NSMutableAttributedString()
        let Name3 = "Full Name"
        
        placeHolder3 = NSMutableAttributedString(string: Name3, attributes: [NSFontAttributeName : UIFont(name: "Gotham", size: 14.0)!])
        
        placeHolder3.addAttribute(NSForegroundColorAttributeName, value: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.35), range: NSRange(location:0,length:Name3.characters.count))
        
        nameField.attributedPlaceholder = placeHolder3
        
        let paddingView3 = UIView(frame: CGRect(x:0, y:0, width:15, height:self.nameField.frame.height))
        nameField.leftView = paddingView3
        nameField.leftViewMode = UITextFieldViewMode.always
        
        var placeHolder4 = NSMutableAttributedString()
        let Name4 = "Nickname"
        
        placeHolder4 = NSMutableAttributedString(string: Name4, attributes: [NSFontAttributeName : UIFont(name: "Gotham", size: 14.0)!])
        
        placeHolder4.addAttribute(NSForegroundColorAttributeName, value: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.35), range: NSRange(location:0,length:Name4.characters.count))
        
        lastField.attributedPlaceholder = placeHolder4
        
        let paddingView4 = UIView(frame: CGRect(x:0, y:0, width:15, height:self.lastField.frame.height))
        lastField.leftView = paddingView4
        lastField.leftViewMode = UITextFieldViewMode.always
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func facebookAccount(_ sender: Any) {
    }
    
    @IBAction func createAccount(_ sender: Any) {
        guard let name = nameField.text,
        name != "",
        let nickname = lastField.text,
        nickname != "",
        let email = emailField.text,
        email != "",
        let password = passwordField.text,
        password != ""
            else {
                AlertController.showAlert(self, title: "Forget Something?", message: "Please fill out all fields.")
                return
        }
        
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
            guard error == nil else {
                AlertController.showAlert(self, title: "Error", message: error!.localizedDescription)
                return
            }
            guard let user = user else {
                return
            }
            print(user.email ?? "MISSING EMAIL")
            print(user.uid)
            
            let changeRequest = user.profileChangeRequest()
            changeRequest.displayName = name
            changeRequest.commitChanges(completion: { (error) in
                guard error == nil else {
                    AlertController.showAlert(self, title: "Error", message: error!.localizedDescription)
                    return
                }
                
                self.performSegue(withIdentifier: "signup", sender: nil)
            })
        })
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
