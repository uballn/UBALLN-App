//
//  SetupViewController.swift
//  UBALLN Basketball
//
//  Created by Jeremy Gaston on 4/19/17.
//  Copyright © 2017 UBALLN. All rights reserved.
//

import UIKit
import Firebase
import GooglePlaces

class SetupViewController: UIViewController, GADInterstitialDelegate {
    
    var interstitial: GADInterstitial!
    
    var refGame = FIRDatabaseReference()

    @IBOutlet var thumbnail: UIImageView!
    @IBOutlet var whereField: UITextField!
    @IBOutlet var whenField: UITextField!
    @IBOutlet var ctaButton: UIButton!
    @IBOutlet var addressField: UITextField!
    @IBOutlet var friendsButton: UIButton!
    @IBOutlet var Switch: UISwitch!
    @IBOutlet var Share: UISwitch!
    
    let when = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refGame = FIRDatabase.database().reference().child("games")

        thumbnail.layer.cornerRadius = 13
        thumbnail.layer.borderWidth = 1
        thumbnail.layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1).cgColor
        whereField.layer.cornerRadius = 2
        whenField.layer.cornerRadius = 2
        ctaButton.layer.cornerRadius = 2
        addressField.layer.cornerRadius = 2
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector (self.someAction (_:)))
        thumbnail.addGestureRecognizer(tapGesture)
        thumbnail.isUserInteractionEnabled = true
        
        let imgTitle = UIImage(named: "uballn-logo")
        navigationItem.titleView = UIImageView(image: imgTitle)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        var placeHolder1 = NSMutableAttributedString()
        let Name = "Where will you play?"
        
        placeHolder1 = NSMutableAttributedString(string: Name, attributes: [NSFontAttributeName : UIFont(name: "Gotham", size: 14.0)!])
        
        placeHolder1.addAttribute(NSForegroundColorAttributeName, value: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.35), range: NSRange(location:0,length:Name.characters.count))
        
        whereField.attributedPlaceholder = placeHolder1
        
        let paddingView = UIView(frame: CGRect(x:0, y:0, width:15, height:self.whereField.frame.height))
        whereField.leftView = paddingView
        whereField.leftViewMode = UITextFieldViewMode.always
        
        var placeHolder2 = NSMutableAttributedString()
        let Name2 = "What's the address?"
        
        placeHolder2 = NSMutableAttributedString(string: Name2, attributes: [NSFontAttributeName : UIFont(name: "Gotham", size: 14.0)!])
        
        placeHolder2.addAttribute(NSForegroundColorAttributeName, value: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.35), range: NSRange(location:0,length:Name2.characters.count))
        
        addressField.attributedPlaceholder = placeHolder2
        
        let paddingView2 = UIView(frame: CGRect(x:0, y:0, width:15, height:self.addressField.frame.height))
        addressField.leftView = paddingView2
        addressField.leftViewMode = UITextFieldViewMode.always
        
        var placeHolder3 = NSMutableAttributedString()
        let Name3 = "When will you play?"
        
        placeHolder3 = NSMutableAttributedString(string: Name3, attributes: [NSFontAttributeName : UIFont(name: "Gotham", size: 14.0)!])
        
        placeHolder3.addAttribute(NSForegroundColorAttributeName, value: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.35), range: NSRange(location:0,length:Name3.characters.count))
        
        whenField.attributedPlaceholder = placeHolder3
        
        let paddingView3 = UIView(frame: CGRect(x:0, y:0, width:15, height:self.whenField.frame.height))
        whenField.leftView = paddingView3
        whenField.leftViewMode = UITextFieldViewMode.always
        
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        let request = GADRequest()
        interstitial.load(request)
        interstitial.delegate = self
        
        interstitial = createAndLoadInterstitial()
        disabler()
        createDatePicker()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addFriends(_ sender: Any) {
        let add = storyboard?.instantiateViewController(withIdentifier: "contacts")
        self.present(add!, animated: false, completion: nil)
    }
    
    @IBAction func setPrivacy(_ sender: Any) {
        if Switch.isOn {
            friendsButton.isEnabled = true
            Share.isEnabled = false
        } else {
            friendsButton.isEnabled = false
            Share.isEnabled = true
        }
    }
    
    @IBAction func shareGame(_ sender: Any) {
        
    }
    
    @IBAction func setupGame(_ sender: Any) {
        guard let place = whereField.text,
            place != "",
            let address = addressField.text,
            address != "",
            let date = whenField.text,
            date != ""
            else {
                AlertController.showAlert(self, title: "Wait A Minute", message: "Please fill out all fields.")
                return
        }
        
        addGame()
        
        if interstitial.isReady {
            interstitial.present(fromRootViewController: self)
        } else {
            print("Ad wasn't ready")
        }
        
    }
    
    @IBAction func listView(_ sender: Any) {
        let tab1 = storyboard?.instantiateViewController(withIdentifier: "listView")
        self.present(tab1!, animated: false, completion: nil)
    }
    
    @IBAction func mapView(_ sender: Any) {
        let tab2 = storyboard?.instantiateViewController(withIdentifier: "mapView")
        self.present(tab2!, animated: false, completion: nil)
    }
    
    func addGame() {
        let key = refGame.childByAutoId().key
        
        let users = ["id": key,
                     "place": whereField.text! as String,
                     "address": addressField.text! as String,
                     "date": whenField.text! as String
        ]
        refGame.child(key).setValue(users)
    }
    
    func disabler() {
        if Switch.isOn {
            friendsButton.isEnabled = true
            Share.isEnabled = false
        } else {
            friendsButton.isEnabled = false
            Share.isEnabled = true
        }
    }
    
    func someAction(_ sender:UITapGestureRecognizer){
        let controller = storyboard?.instantiateViewController(withIdentifier: "profileView")
        self.present(controller!, animated: false, completion: nil)
    }
    
    func createDatePicker(){
        when.datePickerMode = .dateAndTime
        when.minimumDate = Date()
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: false)
        
        whenField.inputAccessoryView = toolbar
        
        whenField.inputView = when
    }
    
    func donePressed(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        
        whenField.text = dateFormatter.string(from: when.date)
        self.view.endEditing(true)
    }
    
    func createAndLoadInterstitial() -> GADInterstitial {
        let interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        interstitial.delegate = self
        interstitial.load(GADRequest())
        return interstitial
    }
    
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        interstitial = createAndLoadInterstitial()
        AlertController.showAlert(self, title: "Success!", message: "Your game was successfully created.")
        return
    }
    
}
