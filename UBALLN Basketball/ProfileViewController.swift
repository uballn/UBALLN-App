//
//  ProfileViewController.swift
//  UBALLN Basketball
//
//  Created by Jeremy Gaston on 4/27/17.
//  Copyright © 2017 UBALLN. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // Outlets
    
    @IBOutlet var name: UILabel!
    @IBOutlet var aka: UILabel!
    @IBOutlet var profile: UIImageView!
    @IBOutlet weak var photo: UIButton!
    
    // Variables
    
    var databaseRef: FIRDatabaseReference! {
        return FIRDatabase.database().reference()
    }
    
    var storageRef: FIRStorage {
        return FIRStorage.storage()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photo.layer.cornerRadius = 25
        photo.layer.borderWidth = 1
        photo.layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.25).cgColor
        
        name.text = name.text!.uppercased()
        aka.text = aka.text!.uppercased()

        guard let username = FIRAuth.auth()?.currentUser?.displayName else {
            return
        }
        
        name.text = "\(username)"
    }
    
    // Actions
    
    @IBAction func chooseImage(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController()
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
            
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
            } else {
                print("Camera not available")
            }
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action:UIAlertAction) in imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    @IBAction func dismissVC(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func friends(_ sender: Any) {
        let tab2 = storyboard?.instantiateViewController(withIdentifier: "myFriends")
        self.present(tab2!, animated: false, completion: nil)
    }
    
    @IBAction func logout(_ sender: Any) {
        do {
            try FIRAuth.auth()?.signOut()
            
            if FIRAuth.auth()?.currentUser == nil {
                UserDefaults.standard.removeObject(forKey: "uid")
                UserDefaults.standard.synchronize()
            }
            performSegue(withIdentifier: "landing", sender: nil)
        } catch {
            print(error)
        }
    }
    
    // Functions
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        profile.image = image
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
