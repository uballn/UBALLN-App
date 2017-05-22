//
//  PasswordViewController.swift
//  UBALLN Basketball
//
//  Created by Jeremy Gaston on 5/11/17.
//  Copyright © 2017 UBALLN. All rights reserved.
//

import UIKit

class PasswordViewController: UIViewController {
    
    @IBOutlet var emailField: UITextField!
    @IBOutlet var resetBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        emailField.layer.cornerRadius = 2
        resetBtn.layer.cornerRadius = 2
        
        var placeHolder1 = NSMutableAttributedString()
        let Name = "Email Address"
        
        placeHolder1 = NSMutableAttributedString(string: Name, attributes: [NSFontAttributeName : UIFont(name: "Gotham", size: 12.0)!])
        
        placeHolder1.addAttribute(NSForegroundColorAttributeName, value: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.35), range: NSRange(location:0,length:Name.characters.count))
        
        emailField.attributedPlaceholder = placeHolder1
        
        let paddingView = UIView(frame: CGRect(x:0, y:0, width:15, height:self.emailField.frame.height))
        emailField.leftView = paddingView
        emailField.leftViewMode = UITextFieldViewMode.always
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
