//
//  InboxViewController.swift
//  UBALLN Basketball
//
//  Created by Jeremy Gaston on 4/28/17.
//  Copyright © 2017 UBALLN. All rights reserved.
//

import UIKit

class InboxViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtn(_ sender: UIBarButtonItem) {
        dismiss(animated: false, completion: nil)
    }
    
}
