//
//  SetupViewController.swift
//  UBALLN Basketball
//
//  Created by Jeremy Gaston on 4/19/17.
//  Copyright © 2017 UBALLN. All rights reserved.
//

import UIKit

class SetupViewController: UIViewController {

    @IBOutlet var thumbnail: UIImageView!
    @IBOutlet var whereField: UITextField!
    @IBOutlet var whenField: UITextField!
    @IBOutlet var ctaButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        thumbnail.layer.cornerRadius = 13
        thumbnail.layer.borderWidth = 1
        thumbnail.layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1).cgColor
        whereField.layer.cornerRadius = 2
        whenField.layer.cornerRadius = 2
        ctaButton.layer.cornerRadius = 2
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector (self.someAction (_:)))
        thumbnail.addGestureRecognizer(tapGesture)
        thumbnail.isUserInteractionEnabled = true
        
        let imgTitle = UIImage(named: "uballn-logo")
        navigationItem.titleView = UIImageView(image: imgTitle)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        var placeHolder1 = NSMutableAttributedString()
        let Name = "Where will you play?"
        
        placeHolder1 = NSMutableAttributedString(string: Name, attributes: [NSFontAttributeName : UIFont(name: "Gotham", size: 12.0)!])
        
        placeHolder1.addAttribute(NSForegroundColorAttributeName, value: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.35), range: NSRange(location:0,length:Name.characters.count))
        
        whereField.attributedPlaceholder = placeHolder1
        
        let paddingView = UIView(frame: CGRect(x:0, y:0, width:15, height:self.whereField.frame.height))
        whereField.leftView = paddingView
        whereField.leftViewMode = UITextFieldViewMode.always
        
        var placeHolder2 = NSMutableAttributedString()
        let Name2 = "When will you play?"
        
        placeHolder2 = NSMutableAttributedString(string: Name2, attributes: [NSFontAttributeName : UIFont(name: "Gotham", size: 12.0)!])
        
        placeHolder2.addAttribute(NSForegroundColorAttributeName, value: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.35), range: NSRange(location:0,length:Name2.characters.count))
        
        whenField.attributedPlaceholder = placeHolder2
        
        let paddingView2 = UIView(frame: CGRect(x:0, y:0, width:15, height:self.whenField.frame.height))
        whenField.leftView = paddingView2
        whenField.leftViewMode = UITextFieldViewMode.always

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func listView(_ sender: Any) {
        let tab1 = storyboard?.instantiateViewController(withIdentifier: "listView")
        self.present(tab1!, animated: false, completion: nil)
    }
    
    @IBAction func mapView(_ sender: Any) {
        let tab2 = storyboard?.instantiateViewController(withIdentifier: "mapView")
        self.present(tab2!, animated: false, completion: nil)
    }
    
    func someAction(_ sender:UITapGestureRecognizer){
        let controller = storyboard?.instantiateViewController(withIdentifier: "profileView")
        self.present(controller!, animated: false, completion: nil)
    }
}
