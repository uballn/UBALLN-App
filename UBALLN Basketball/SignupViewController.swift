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
    
    let databaseRef = FIRDatabase.database().reference(fromURL: "https://uballn-basketball-2f8d6.firebaseio.com/")

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

    @IBAction func facebookAccount(_ sender: Any) {
    }
    
    @IBAction func createAccount(_ sender: Any) {
        if emailField.text == "" {
            let alertController = UIAlertController(title: "Forget something?", message: "Please enter your email and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        } else {
            FIRAuth.auth()?.createUser(withEmail: emailField.text!, password: passwordField.text!) { (user, error) in
                
                if error == nil {
                    print("You have successfully signed up")
                    //Goes to the Setup page which lets the user take a photo for their profile picture and also chose a username
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "info")
                    self.present(vc!, animated: true, completion: nil)
                    
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
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
