//
//  ListViewController.swift
//  UBALLN Basketball
//
//  Created by Jeremy Gaston on 4/24/17.
//  Copyright © 2017 UBALLN. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let imageList = ["24HR-img.jpg","Timberglen-img.jpg","YMCA-img.jpg","Lifetime-img.jpg"]
    let addressList = ["5100 Belt Line Rd #600","3810 Timberglen Rd","4332 Northaven Rd","3419 Trinity Mills Rd"]
    let distanceList = ["0.1 mi","4.2 mi","4.4 mi","3.7 mi"]
    let ageTitleList = ["Avg. Age  30","Avg. Age  21","Avg. Age  13","Avg. Age  16"]
    let countTitleList = ["No. Players  5","No. Players  18","No. Players  14","No. Players  9"]
    let experienceTitleList = ["Avg. Exp.  2.75","Avg. Exp.  3.50","Avg. Exp.  1.50","Avg. Exp.  2.00"]
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addressList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locations", for: indexPath) as! ListTableViewCell
        
        cell.cellAddress.text = addressList[indexPath.row]
        cell.cellDistance.text = distanceList[indexPath.row]
        cell.cellAgeTitle.text = ageTitleList[indexPath.row]
        cell.cellCountTitle.text = countTitleList[indexPath.row]
        cell.cellLevelTitle.text = experienceTitleList[indexPath.row]
        
        cell.cellImageView.image = UIImage(named: imageList[indexPath.row])
        
        return cell
    }

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
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
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
