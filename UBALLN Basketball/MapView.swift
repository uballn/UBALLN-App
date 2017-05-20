//
//  MapView.swift
//  UBALLN Basketball
//
//  Created by Jeremy Gaston on 4/14/17.
//  Copyright © 2017 UBALLN. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation

class MapView: UIView {
    
    var manager = CLLocationManager()
    
    var latitude = 32.9508927
    var longitude = -96.82221449999997
    
    GMSServices.provideAPIKey("AIzaSyDPH9ibr6YkH6LHB89wDjxTQgjqiD6uaPY")
        
    let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 17.0)
    let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
    let mapInsets = UIEdgeInsets(top: 0, left: 0, bottom: 55, right: 0)
    mapView.padding = mapInsets
    mapView.isMyLocationEnabled = true
    view = mapView
        
    // Creates a marker in the center of the map.
    let marker = GMSMarker()
    marker.icon = UIImage(named: "map-ico")
    marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    marker.map = mapView
        
    // Creates the my location button
    mapView.settings.myLocationButton = true
}
