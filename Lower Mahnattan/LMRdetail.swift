//
//  LMRdetail.swift
//  NewYorkTour
//
//  Created by Taewook Noh on 2018. 1. 5..
//  Copyright © 2018년 taewook. All rights reserved.
//

import UIKit
import GoogleMaps

class LMRdetail: UIViewController {
    
    @IBOutlet weak var foodimage: UIImageView!
    @IBOutlet weak var pagecontrol: UIPageControl!
    
    var image=["test01.png", "test02.jpeg"]
    
    @IBOutlet weak var view02: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pagecontrol.numberOfPages = image.count
        pagecontrol.currentPage = 0
        pagecontrol.pageIndicatorTintColor = UIColor.green
        pagecontrol.currentPageIndicatorTintColor = UIColor.red
        foodimage.image = UIImage(named: image[0])
        
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        view02 = mapView
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func pageChanged(_ sender: UIPageControl) {
        foodimage.image = UIImage(named:image[pagecontrol.currentPage])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

