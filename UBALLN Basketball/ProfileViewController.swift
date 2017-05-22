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
    
    @IBOutlet var name: UILabel!
    @IBOutlet var aka: UILabel!
    @IBOutlet var profile: UIImageView!
    @IBOutlet weak var messages: UIButton!
    @IBOutlet weak var edit: UIButton!
    @IBOutlet var settings: UIButton!
    
    var databaseRef: FIRDatabaseReference! {
        return FIRDatabase.database().reference()
    }
    
    var storageRef: FIRStorage {
        return FIRStorage.storage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messages.layer.cornerRadius = 25
        messages.layer.borderWidth = 1
        messages.layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.25).cgColor
        
        edit.layer.cornerRadius = 25
        edit.layer.borderWidth = 1
        edit.layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.25).cgColor
        
        settings.layer.cornerRadius = 25
        settings.layer.borderWidth = 1
        settings.layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.25).cgColor
        
        name.text = name.text!.uppercased()
        aka.text = aka.text!.uppercased()
        
        guard let nickname = FIRAuth.auth()?.currentUser?.displayName else {
            return
        }
        
        name.text = "\(nickname)"
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//        
//        loadUserInfo()
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func chooseImage(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController(title: "Profile image", message: "Select an image", preferredStyle: .actionSheet)
        
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
    
    @IBAction func inbox(_ sender: Any) {
        let tab1 = storyboard?.instantiateViewController(withIdentifier: "notifyMe")
        self.present(tab1!, animated: false, completion: nil)
    }
    
    @IBAction func friends(_ sender: Any) {
        let tab2 = storyboard?.instantiateViewController(withIdentifier: "myFriends")
        self.present(tab2!, animated: false, completion: nil)
    }
    
    @IBAction func settings(_ sender: Any) {
        let tab3 = storyboard?.instantiateViewController(withIdentifier: "mySettings")
        self.present(tab3!, animated: false, completion: nil)
    }
    
    @IBAction func edit(_ sender: Any) {
        let tab4 = storyboard?.instantiateViewController(withIdentifier: "myInfo")
        self.present(tab4!, animated: false, completion: nil)
    }
    
    @IBAction func logout(_ sender: Any) {
        do {
            try FIRAuth.auth()?.signOut()
            performSegue(withIdentifier: "landing", sender: nil)
        } catch {
            print(error)
        }
    }
    
//    func loadUserInfo(){
//        let userRef = databaseRef.child("details/\(FIRAuth.auth()!.currentUser!.uid)")
//        userRef.observe(.value, with: { (snapshot) in
//            let user = User(snapshot: snapshot)
//            self.height.text = user.height
//            self.weight.text = user.weight
//            self.age.text = user.age!
//            self.experience.text = user.played!
//        }) { (error) in
//            print(error.localizedDescription)
//        }
//    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        profile.image = image
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
