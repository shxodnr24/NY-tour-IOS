//
//  LowerManhattanData.swift
//  NewYorkTour
//
//  Created by Taewook Noh on 2017. 12. 18..
//  Copyright © 2017년 taewook. All rights reserved.
//

import Foundation
let lowerManhattanData : LowerManhattanData = LowerManhattanData()

class LowerManhattanData {
   
    var restaurantName:[LowerRestaurant] = []
    var lowertourname:[LowerAttractions] = []
    init() {
        
        let noomemorial = LowerAttractions(name : "9/11 Memorial")
        let noomuseum = LowerAttractions(name : "9/11 Museum")
        let oneworldtrade = LowerAttractions(name : "One World Trade Center")
        
        lowertourname += [noomemorial, noomuseum, oneworldtrade]
    }
}
class LowerAttractions {
    let name : String
    
    init(name:String) {
        self.name = name
    }
}

class LowerRestaurant {
    let name : String
    
    init(name:String) {
        self.name = name
    }
}
