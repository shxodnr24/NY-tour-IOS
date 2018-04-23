//
//  UpperEastRestaurantDetail.swift
//  NewYorkTour
//
//  Created by Taewook Noh on 2018. 4. 22..
//  Copyright © 2018년 taewook. All rights reserved.
//

import UIKit
import CoreLocation

class UpperEastRestaurantDetail: UIViewController {

    var name:String?
    var address:String?
     lazy var geocoder = CLGeocoder()
    
    @IBOutlet weak var addressCell: UILabel!
    @IBOutlet weak var nameCell: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        geocoder.geocodeAddressString(address!) {
            (CLPlacemark, error) in
            self.processResponse(withPlacemarks: CLPlacemark, error: error)
        }
        
            nameCell.text = name
            addressCell.text = address
        // Do any additional setup after loading the view.
    }

    
    private func processResponse(withPlacemarks placemarks: [CLPlacemark]?, error: Error?) {
        // Update View
        // geocodeButton.isHidden = false
        //  activityIndicatorView.stopAnimating()
        
        if let error = error {
            print("Unable to Forward Geocode Address (\(error))")
         print("Unable to Find Location for Address")
            
        } else {
            var location: CLLocation?
            
            if let placemarks = placemarks, placemarks.count > 0 {
                location = placemarks.first?.location
            }
            
            if let location = location {
                let coordinate = location.coordinate
               sendData(latitude: coordinate.latitude, longtitude: coordinate.longitude, id:name!)
            print("\(coordinate.latitude), \(coordinate.longitude)")
            } else {
               print("No Matching Location Found")
            }
        }
    }
    
    func sendData(latitude:Double, longtitude:Double, id:String) {
        let CVC = childViewControllers.last as! UpperEastRestaurantDetailMap
        CVC.receive(latitude: latitude, longtitude: longtitude, id:id)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
