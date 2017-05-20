//
//  ListViewController.swift
//  UBALLN Basketball
//
//  Created by Jeremy Gaston on 4/24/17.
//  Copyright © 2017 UBALLN. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ListViewController: UIViewController {

    @IBOutlet var thumbnail: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        thumbnail.layer.cornerRadius = 13
        thumbnail.layer.borderWidth = 1
        thumbnail.layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1).cgColor
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector (self.someAction (_:)))
        thumbnail.addGestureRecognizer(tapGesture)
        thumbnail.isUserInteractionEnabled = true
        
        let imgTitle = UIImage(named: "uballn-logo")
        navigationItem.titleView = UIImageView(image: imgTitle)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func mapView(_ sender: Any) {
        let tab2 = storyboard?.instantiateViewController(withIdentifier: "mapView")
        self.present(tab2!, animated: false, completion: nil)
    }
    @IBAction func setupGame(_ sender: Any) {
        let tab3 = storyboard?.instantiateViewController(withIdentifier: "setupView")
        self.present(tab3!, animated: false, completion: nil)
    }
    
    func someAction(_ sender:UITapGestureRecognizer){
        let controller = storyboard?.instantiateViewController(withIdentifier: "profileView")
        self.present(controller!, animated: false, completion: nil)
    }
}
