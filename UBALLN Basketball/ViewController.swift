//
//  ViewController.swift
//  UBALLN Basketball
//
//  Created by Jeremy Gaston on 3/8/17.
//  Copyright © 2017 UBALLN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var btn01: UIButton!
    @IBOutlet var btn02: UIButton!
    @IBOutlet var featureView: UIScrollView!
    
    let feature1 = ["title":"UBALLN BASKETBALL","body":"New to the club? Join now and get started. Already hoopin with UBALLN? Log in or join now and we'll show you every game nearby.","image":"Home-ico"]
    let feature2 = ["title":"BASKETBALL IS A TEAM SPORT","body":"Your teammates are what'll keep you going -- from pick-me-ups to peer pressure, from camaraderie to competition.","image":"games-ico"]
    let feature3 = ["title":"METRICS MATTER","body":"New to the club? Join now and get started. Already hoopin with UBALLN? Log in or join now and we'll show you every game nearby.","image":"help-ico"]
    let feature4 = ["title":"GOOD COACHING EVOLVES","body":"Your teammates are what'll keep you going -- from pick-me-ups to peer pressure, from camaraderie to competition.","image":"hamburger btn"]
    let feature5 = ["title":"MUSIC MOVES YOU","body":"New to the club? Join now and get started. Already hoopin with UBALLN? Log in or join now and we'll show you every game nearby.","image":"logout-ico"]
    
    var featureArray = [Dictionary<String,String>]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        featureArray = [feature1,feature2,feature3,feature4,feature5]
        featureView.isPagingEnabled = true
        featureView.contentSize = CGSize(width: self.view.bounds.width * CGFloat(featureArray.count), height: 460)
        featureView.showsHorizontalScrollIndicator = false
        
        btn01.layer.cornerRadius = 2
        btn02.layer.cornerRadius = 2
        btn02.layer.borderWidth = 1.5
        btn02.layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.10).cgColor
        
        loadFeatures()
        
    }
    
    func loadFeatures() {
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func join(_ sender: Any) {
        let tab1 = storyboard?.instantiateViewController(withIdentifier: "joinView")
        self.present(tab1!, animated: false, completion: nil)
    }
    
    @IBAction func login(_ sender: Any) {
        let tab2 = storyboard?.instantiateViewController(withIdentifier: "loginView")
        self.present(tab2!, animated: false, completion: nil)
    }
    
}

