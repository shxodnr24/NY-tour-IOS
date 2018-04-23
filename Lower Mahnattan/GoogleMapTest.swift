//
//  GoogleMapTest.swift
//  NewYorkTour
//
//  Created by Taewook Noh on 2018. 1. 7..
//  Copyright © 2018년 taewook. All rights reserved.
//

import UIKit
import GoogleMaps

class GoogleMapTest: UIViewController {
    
    // You don't need to modify the default init(nibName:bundle:) method.
    
    override func loadView() {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: 40.712878, longitude: -74.013287, zoom: 15.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 40.712878, longitude: -74.013287)
        marker.title = "One World Trade Center"
        marker.snippet = "NewYork"
        marker.map = mapView
    }
}
