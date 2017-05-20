//
//  ShareViewController.swift
//  UBALLN Basketball
//
//  Created by Jeremy Gaston on 5/12/17.
//  Copyright © 2017 UBALLN. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {

    @IBOutlet var done: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        done.layer.cornerRadius = 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func doneCTA(_ sender: Any) {
    }
}
