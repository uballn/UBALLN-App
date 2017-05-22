//
//  User.swift
//  UBALLN Basketball
//
//  Created by Jeremy Gaston on 5/21/17.
//  Copyright © 2017 UBALLN. All rights reserved.
//

import Foundation
import Firebase

struct User {
    var gender: String!
    var age: String!
    var height: String?
    var weight: String?
    var played: String!
    var photoURL: String?
    var uid: String!
    var ref: FIRDatabaseReference?
    var key: String?
    
    init(snapshot: FIRDataSnapshot) {
        key = snapshot.key
        ref = snapshot.ref
        gender = (snapshot.value! as! NSDictionary)["gender"] as! String
        age = (snapshot.value! as! NSDictionary)["age"] as! String
        height = (snapshot.value! as! NSDictionary)["height"] as? String
        weight = (snapshot.value! as! NSDictionary)["weight"] as? String
        played = (snapshot.value! as! NSDictionary)["played"] as! String
        photoURL = (snapshot.value! as! NSDictionary)["photoURL"] as? String
        uid = (snapshot.value! as! NSDictionary)["uid"] as! String
    }
}
