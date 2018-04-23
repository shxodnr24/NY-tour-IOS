//
//  UpperEastRestaurantData.swift
//  NewYorkTour
//
//  Created by Taewook Noh on 2018. 4. 18..
//  Copyright © 2018년 taewook. All rights reserved.
//

import Foundation

class UpperEastTouristAttractionData {
    var id : String?
    var imageURL : String?
    var info : String?
    var location : String?
    
    init(id:String?, imageURL:String?, info:String?, location:String?)
    {
        self.id = id
        self.imageURL = imageURL
        self.info = info
        self.location = location
        
        
    }
    
}
