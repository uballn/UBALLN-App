//
//  MapViewController.swift
//  UBALLN Basketball
//
//  Created by Jeremy Gaston on 4/14/17.
//  Copyright © 2017 UBALLN. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps

class MapViewController: UIViewController {

    var manager = CLLocationManager()
    
    var latitude = 32.9508927
    var longitude = -96.82221449999997
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GMSServices.provideAPIKey("AIzaSyDPH9ibr6YkH6LHB89wDjxTQgjqiD6uaPY")
        
        let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 17.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        let mapInsets = UIEdgeInsets(top: 0, left: 0, bottom: 60, right: 0)
        mapView.padding = mapInsets
        mapView.isMyLocationEnabled = true
        view = mapView
        
        // Creates the my location button
        mapView.settings.myLocationButton = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
