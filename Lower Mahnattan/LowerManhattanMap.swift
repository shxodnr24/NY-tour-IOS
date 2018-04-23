//
//  LowerManhattanMap.swift
//  NewYorkTour
//
//  Created by Taewook Noh on 2017. 12. 27..
//  Copyright © 2017년 taewook. All rights reserved.
//

import UIKit
import MapKit

class LowerManhattanMap: UIViewController, CLLocationManagerDelegate  {
    
  
    
    @IBOutlet weak var lowermap: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        lowermap.showsUserLocation = true
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0
        {
            //타임스퀘어
            setAnnotation(latitude: 40.759155, longtitude: -73.985099, delta: 1, title: "TimesSquare", subtitle: "New york city")
        }
        
        else if sender.selectedSegmentIndex == 1
        {
            //원월드 트레이드 센터
             setAnnotation(latitude: 40.712878, longtitude: -74.013287, delta: 1, title: "One World Trade Center", subtitle: "285 Fulton St, New York, NY 10007 미국")
        }
    }
    
    func goLocation(latitude latitudeValue: CLLocationDegrees, longtitude longtitudeValue:CLLocationDegrees, delta span : Double)->CLLocationCoordinate2D
    {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longtitudeValue)
        let spanValue = MKCoordinateSpanMake(span, span)
        let pRegion = MKCoordinateRegionMake(pLocation, spanValue)
        lowermap.setRegion(pRegion, animated: true)
        return pLocation
    }
    
    func setAnnotation(latitude latitudeValue: CLLocationDegrees, longtitude longtitudeValue:CLLocationDegrees, delta span : Double, title strTitle : String, subtitle strSubtitle: String)
    {
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitude: latitudeValue, longtitude: longtitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        lowermap.addAnnotation(annotation)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last
        goLocation(latitude: (pLocation?.coordinate.latitude)!, longtitude: (pLocation?.coordinate.longitude)!, delta: 0.01)
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error) -> Void in
            let pm = placemarks!.first
            let country = pm!.country
            var address:String = country!
            if pm!.locality != nil {
                address += " "
                address += pm!.locality!
            }
            
            if pm!.thoroughfare != nil {
                address += " "
                address += pm!.thoroughfare!
            }
            
        })
        
        locationManager.stopUpdatingLocation()
    }
    

}
