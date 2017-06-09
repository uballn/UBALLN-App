//
//  ViewController.swift
//  UBALLN Basketball
//
//  Created by Jeremy Gaston on 3/8/17.
//  Copyright © 2017 UBALLN. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UIScrollViewDelegate {
    
    // Outlets
    
    @IBOutlet var btn01: UIButton!
    @IBOutlet var btn02: UIButton!
    @IBOutlet var featureView: UIScrollView!
    @IBOutlet var pageControl: UIPageControl!
    
    // Variables
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userLoggedIn()
        
        btn01.layer.cornerRadius = 2
        btn02.layer.cornerRadius = 2
        btn02.layer.borderWidth = 1.5
        btn02.layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.10).cgColor
        
        featureView.delegate = self
        let slides:[FeaturesView] = createSlides()
        loadFeatures(slides: slides)
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubview(toFront: pageControl)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Actions
    
    @IBAction func join(_ sender: Any) {
        let tab1 = storyboard?.instantiateViewController(withIdentifier: "joinView")
        self.present(tab1!, animated: false, completion: nil)
    }
    
    @IBAction func login(_ sender: Any) {
        let tab2 = storyboard?.instantiateViewController(withIdentifier: "loginView")
        self.present(tab2!, animated: false, completion: nil)
    }
    
    // Functions
    
    func createSlides() -> [FeaturesView] {
        let slide1:FeaturesView = Bundle.main.loadNibNamed("Features", owner: self, options: nil)?.first as! FeaturesView
        slide1.text.text = "New to the club? Join now & get started. Already hoopin with UBALLN? Log in or join now and we'll show you every game nearby."
        slide1.image.image = UIImage(named: "loading1")
        
        let slide2:FeaturesView = Bundle.main.loadNibNamed("Features", owner: self, options: nil)?.first as! FeaturesView
        slide2.text.text = "New to the club? Join now and get started. Already hoopin with UBALLN? Log in or join now and we'll show you every game nearby."
        slide2.image.image = UIImage(named: "loading2")
        
        let slide3:FeaturesView = Bundle.main.loadNibNamed("Features", owner: self, options: nil)?.first as! FeaturesView
        slide3.text.text = "New to the club? Join now and get started. Already hoopin with UBALLN? Log in or join now and we'll show you every game nearby."
        slide3.image.image = UIImage(named: "loading3")
        
        let slide4:FeaturesView = Bundle.main.loadNibNamed("Features", owner: self, options: nil)?.first as! FeaturesView
        slide4.text.text = "New to the club? Join now and get started. Already hoopin with UBALLN? Log in or join now and we'll show you every game nearby."
        slide4.image.image = UIImage(named: "loading4")
        
        let slide5:FeaturesView = Bundle.main.loadNibNamed("Features", owner: self, options: nil)?.first as! FeaturesView
        slide5.text.text = "New to the club? Join now and get started. Already hoopin with UBALLN? Log in or join now and we'll show you every game nearby."
        slide5.image.image = UIImage(named: "loading00")
        return [slide1, slide2, slide3, slide4, slide5]
    }
    
    func loadFeatures(slides: [FeaturesView]) {
        featureView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        featureView.contentSize = CGSize(width: view.frame.width * CGFloat (slides.count), height: view.frame.height)
        featureView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            featureView.addSubview(slides[i])
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
    
    func userLoggedIn() {
        FIRAuth.auth()?.addStateDidChangeListener({ (auth, user) in
            if user != nil {
                let home = self.storyboard?.instantiateViewController(withIdentifier: "mapView")
                self.present(home!, animated: false, completion: nil)
            } else {
                
            }
        })
    }
    
}

