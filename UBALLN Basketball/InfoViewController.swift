//
//  InfoViewController.swift
//  UBALLN Basketball
//
//  Created by Jeremy Gaston on 5/11/17.
//  Copyright © 2017 UBALLN. All rights reserved.
//

import UIKit
import Firebase

class InfoViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var gender = ["––", "male", "female"]
    var experience = ["––", "recreational", "high school", "collegiate", "semi-pro", "professional"]
    var height = ["4+", "5' 0", "5' 1", "5' 2", "5' 3", "5' 4", "5' 5", "5' 6", "5' 7", "5' 8", "5' 9", "5' 10", "5' 11", "6' 0", "6' 1", "6' 2", "6' 3", "6' 4", "6' 5", "6' 6", "6' 7", "6' 8", "6' 9", "6' 10", "6' 11", "7+"]
    var weight = ["80+ lbs", "90+ lbs", "100+ lbs", "105+ lbs", "110+ lbs", "115+ lbs", "120+ lbs", "125+ lbs", "130+ lbs", "135+ lbs", "140+ lbs", "145+ lbs", "150+ lbs", "155+ lbs", "160+ lbs", "165+ lbs", "170+ lbs", "175+ lbs", "180+ lbs", "185+ lbs", "190+ lbs", "195+ lbs", "200+ lbs", "205+ lbs", "210+ lbs", "215+ lbs", "220+ lbs", "225+ lbs", "230+ lbs", "235+ lbs", "240+ lbs", "245+ lbs", "250+ lbs", "255+ lbs", "260+ lbs", "265+ lbs", "270+ lbs", "275+ lbs", "280+ lbs", "285+ lbs", "290+ lbs", "295+ lbs", "300+ lbs", "310+ lbs", "320+ lbs", "330+ lbs", "340+ lbs", "350+ lbs", "360+ lbs", "370+ lbs", "380+ lbs", "390+ lbs",]
    var refUser = FIRDatabaseReference()
    var uuid = 0
    
    @IBOutlet var nicknameField: UITextField!
    @IBOutlet var genderField: UITextField!
    @IBOutlet var birthdayField: UITextField!
    @IBOutlet var lopField: UITextField!
    @IBOutlet var heightField: UITextField!
    @IBOutlet var weightField: UITextField!
    @IBOutlet var resetBtn: UIButton!
    
    let birthday = UIDatePicker()
    let picker1 = UIPickerView()
    let picker2 = UIPickerView()
    let picker3 = UIPickerView()
    let picker4 = UIPickerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        refUser = FIRDatabase.database().reference().child("users")
        picker1.delegate = self
        picker1.dataSource = self
        picker2.delegate = self
        picker2.dataSource = self
        picker3.delegate = self
        picker3.dataSource = self
        picker4.delegate = self
        picker4.dataSource = self
        
        genderField.inputView = picker1
        lopField.inputView = picker2
        heightField.inputView = picker3
        weightField.inputView = picker4
        
        nicknameField.layer.cornerRadius = 1
        genderField.layer.cornerRadius = 1
        birthdayField.layer.cornerRadius = 1
        lopField.layer.cornerRadius = 1
        heightField.layer.cornerRadius = 1
        weightField.layer.cornerRadius = 1
        resetBtn.layer.cornerRadius = 1
        
        var placeHolder0 = NSMutableAttributedString()
        let Name0 = "Nickname"
        
        placeHolder0 = NSMutableAttributedString(string: Name0, attributes: [NSFontAttributeName : UIFont(name: "Gotham", size: 14.0)!])
        
        placeHolder0.addAttribute(NSForegroundColorAttributeName, value: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.35), range: NSRange(location:0,length:Name0.characters.count))
        
        nicknameField.attributedPlaceholder = placeHolder0
        
        let paddingView0 = UIView(frame: CGRect(x:0, y:0, width:15, height:self.nicknameField.frame.height))
        nicknameField.leftView = paddingView0
        nicknameField.leftViewMode = UITextFieldViewMode.always
        
        var placeHolder1 = NSMutableAttributedString()
        let Name1 = "M/F"
        
        placeHolder1 = NSMutableAttributedString(string: Name1, attributes: [NSFontAttributeName : UIFont(name: "Gotham", size: 14.0)!])
        
        placeHolder1.addAttribute(NSForegroundColorAttributeName, value: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.35), range: NSRange(location:0,length:Name1.characters.count))
        
        genderField.attributedPlaceholder = placeHolder1
        
        let paddingView1 = UIView(frame: CGRect(x:0, y:0, width:15, height:self.genderField.frame.height))
        genderField.leftView = paddingView1
        genderField.leftViewMode = UITextFieldViewMode.always
        
        var placeHolder2 = NSMutableAttributedString()
        let Name2 = "Age"
        
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
        
        createDatePicker()
    }

    @IBAction func setupDetails(_ sender: Any) {
        guard let alias = nicknameField.text,
        alias != "",
        let gender = genderField.text,
        gender != "",
        let birthday = birthdayField.text,
        birthday != "",
        let play = lopField.text,
        play != "",
        let height = heightField.text,
        height != "",
        let weight = weightField.text,
        weight != ""
            else {
            AlertController.showAlert(self, title: "Wait A Minute", message: "Please fill out all fields.")
            return
        }
        addUser()
            
        self.performSegue(withIdentifier: "details", sender: nil)
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var countrows : Int = gender.count
        if pickerView == picker1 {
            countrows = self.gender.count
        }
        
        else if pickerView == picker2 {
            countrows = self.experience.count
        }
        
        else if pickerView == picker3 {
            countrows = self.weight.count
        }
        
        else if pickerView == picker4 {
            countrows = self.weight.count
        }
        
        return countrows
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == picker1 {
            let titleRow = gender[row]
                return titleRow
        }
        
        else if pickerView == picker2 {
            let titleRow = experience[row]
                return titleRow
        }
        
        else if pickerView == picker3 {
            let titleRow = height[row]
            return titleRow
        }
        
        else if pickerView == picker4 {
            let titleRow = weight[row]
            return titleRow
        }
        
        return ""
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == picker1 {
            self.genderField.text = self.gender[row]
            self.view.endEditing(true)
        }
        
        else if pickerView == picker2 {
            self.lopField.text = self.experience[row]
            self.view.endEditing(true)
        }
        
        else if pickerView == picker3 {
            self.heightField.text = self.height[row]
            self.view.endEditing(true)
        }
        
        else if pickerView == picker4 {
            self.weightField.text = self.weight[row]
            self.view.endEditing(true)
        }
    }
    
    func createDatePicker(){
        birthday.datePickerMode = .date
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: false)
        
        birthdayField.inputAccessoryView = toolbar
        
        birthdayField.inputView = birthday
    }
    
    func donePressed(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        birthdayField.text = dateFormatter.string(from: birthday.date)
        self.view.endEditing(true)
    }
    
    func addUser(){
        let userID = FIRAuth.auth()?.currentUser?.uid
        
        let values = ["alias": nicknameField.text! as String,
                        "gender": genderField.text! as String,
                        "age": birthdayField.text! as String,
                        "played": lopField.text! as String,
                        "height": heightField.text! as String,
                        "weight": weightField.text! as String
                        ]
        refUser.child(userID!).setValue(values)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
