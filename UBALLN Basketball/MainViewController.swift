//
//  MainViewController.swift
//  UBALLN Basketball
//
//  Created by Jeremy Gaston on 5/8/17.
//  Copyright © 2017 UBALLN. All rights reserved.
//

import UIKit
import GoogleMobileAds

class MainViewController: UIViewController {
    
    @IBOutlet var thumbnail: UIImageView!
    @IBOutlet weak var bannerAd: GADBannerView!
    
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
        
        print("Google Mobile Ads SDK version: \(GADRequest.sdkVersion())")
        bannerAd.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerAd.rootViewController = self
        bannerAd.load(GADRequest())
    }
    
    @IBAction func setupGame(_ sender: Any) {
        let tab3 = storyboard?.instantiateViewController(withIdentifier: "setupView")
        self.present(tab3!, animated: false, completion: nil)
    }
    
    @IBAction func listView(_ sender: Any) {
        let tab1 = storyboard?.instantiateViewController(withIdentifier: "listView")
        self.present(tab1!, animated: false, completion: nil)
    }
    
    func someAction(_ sender:UITapGestureRecognizer){
        let controller = storyboard?.instantiateViewController(withIdentifier: "profileView")
        self.present(controller!, animated: false, completion: nil)
    }
}
