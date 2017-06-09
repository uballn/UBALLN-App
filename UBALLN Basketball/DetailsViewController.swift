//
//  DetailsViewController.swift
//  UBALLN Basketball
//
//  Created by Jeremy Gaston on 5/24/17.
//  Copyright © 2017 UBALLN. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet var detailImage: UIImageView!
    @IBOutlet var detailTitle: UILabel!
    
    var sendData1:String!
    var sendData2:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.backBarButtonItem?.setBackButtonBackgroundImage(UIImage(named: "left.jpg"), for: .normal, barMetrics: .default)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
