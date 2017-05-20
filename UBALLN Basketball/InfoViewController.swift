//
//  InfoViewController.swift
//  UBALLN Basketball
//
//  Created by Jeremy Gaston on 5/11/17.
//  Copyright © 2017 UBALLN. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet var genderField: UITextField!
    @IBOutlet var birthdayField: UITextField!
    @IBOutlet var lopField: UITextField!
    @IBOutlet var heightField: UITextField!
    @IBOutlet var weightField: UITextField!
    @IBOutlet var resetBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        genderField.layer.cornerRadius = 1
        birthdayField.layer.cornerRadius = 1
        lopField.layer.cornerRadius = 1
        heightField.layer.cornerRadius = 1
        weightField.layer.cornerRadius = 1
        resetBtn.layer.cornerRadius = 1

        var placeHolder1 = NSMutableAttributedString()
        let Name1 = "Gender"
        
        placeHolder1 = NSMutableAttributedString(string: Name1, attributes: [NSFontAttributeName : UIFont(name: "Gotham", size: 14.0)!])
        
        placeHolder1.addAttribute(NSForegroundColorAttributeName, value: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.35), range: NSRange(location:0,length:Name1.characters.count))
        
        genderField.attributedPlaceholder = placeHolder1
        
        let paddingView1 = UIView(frame: CGRect(x:0, y:0, width:15, height:self.genderField.frame.height))
        genderField.leftView = paddingView1
        genderField.leftViewMode = UITextFieldViewMode.always
        
        var placeHolder2 = NSMutableAttributedString()
        let Name2 = "Birthday"
        
        placeHolder2 = NSMutableAttributedString(string: Name2, attributes: [NSFontAttributeName : UIFont(name: "Gotham", size: 14.0)!])
        
        placeHolder2.addAttribute(NSForegroundColorAttributeName, value: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.35), range: NSRange(location:0,length:Name2.characters.count))
        
        birthdayField.attributedPlaceholder = placeHolder2
        
        let paddingView2 = UIView(frame: CGRect(x:0, y:0, width:15, height:self.birthdayField.frame.height))
        birthdayField.leftView = paddingView2
        birthdayField.leftViewMode = UITextFieldViewMode.always
        
        var placeHolder3 = NSMutableAttributedString()
        let Name3 = "Highest Level of Play"
        
        placeHolder3 = NSMutableAttributedString(string: Name3, attributes: [NSFontAttributeName : UIFont(name: "Gotham", size: 14.0)!])
        
        placeHolder3.addAttribute(NSForegroundColorAttributeName, value: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.35), range: NSRange(location:0,length:Name3.characters.count))
        
        lopField.attributedPlaceholder = placeHolder3
        
        let paddingView3 = UIView(frame: CGRect(x:0, y:0, width:15, height:self.lopField.frame.height))
        lopField.leftView = paddingView3
        lopField.leftViewMode = UITextFieldViewMode.always
        
        var placeHolder4 = NSMutableAttributedString()
        let Name4 = "Height"
        
        placeHolder4 = NSMutableAttributedString(string: Name4, attributes: [NSFontAttributeName : UIFont(name: "Gotham", size: 14.0)!])
        
        placeHolder4.addAttribute(NSForegroundColorAttributeName, value: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.35), range: NSRange(location:0,length:Name4.characters.count))
        
        heightField.attributedPlaceholder = placeHolder4
        
        let paddingView4 = UIView(frame: CGRect(x:0, y:0, width:15, height:self.heightField.frame.height))
        heightField.leftView = paddingView4
        heightField.leftViewMode = UITextFieldViewMode.always
        
        var placeHolder5 = NSMutableAttributedString()
        let Name5 = "Weight"
        
        placeHolder5 = NSMutableAttributedString(string: Name5, attributes: [NSFontAttributeName : UIFont(name: "Gotham", size: 14.0)!])
        
        placeHolder5.addAttribute(NSForegroundColorAttributeName, value: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.35), range: NSRange(location:0,length:Name5.characters.count))
        
        weightField.attributedPlaceholder = placeHolder5
        
        let paddingView5 = UIView(frame: CGRect(x:0, y:0, width:15, height:self.weightField.frame.height))
        weightField.leftView = paddingView5
        weightField.leftViewMode = UITextFieldViewMode.always

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
