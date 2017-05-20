//
//  TwoTabViewController.swift
//  UBALLN Basketball
//
//  Created by Jeremy Gaston on 4/15/17.
//  Copyright © 2017 UBALLN. All rights reserved.
//

import UIKit

class TwoTabViewController: UIViewController {
    
    var courtsViewController: UIViewController?
    var friendsViewController: UIViewController?

    @IBOutlet weak var contentView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        activeViewController = courtsViewController
    }
    
    @IBAction func didTapCourtsButton(_ sender: Any) {
        activeViewController = courtsViewController
    }
    
    @IBAction func didTapFriendsButton(_ sender: Any) {
        activeViewController = friendsViewController
    }
    
    private var activeViewController: UIViewController? {
        didSet {
            removeInactiveViewController(inactiveViewController: oldValue)
            updateActiveViewController()
        }
    }
    
    private func removeInactiveViewController(inactiveViewController: UIViewController?) {
        if let inActiveVC = inactiveViewController {
            // call before removing child view controller's view from hierarchy
            inActiveVC.willMove(toParentViewController: nil)
            
            inActiveVC.view.removeFromSuperview()
            
            // call after removing child view controller's view from hierarchy
            inActiveVC.removeFromParentViewController()
        }
    }
    
    private func updateActiveViewController() {
        if let activeVC = activeViewController {
            // call before adding child view controller's view as subview
            addChildViewController(activeVC)
            
            activeVC.view.frame = contentView.bounds
            contentView.addSubview(activeVC.view)
            
            // call before adding child view controller's view as subview
            activeVC.didMove(toParentViewController: self)
        }
    }
}
