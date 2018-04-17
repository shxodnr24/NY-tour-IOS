//
//  midtownta.swift
//  NewYorkTour
//
//  Created by Taewook Noh on 2017. 12. 15..
//  Copyright © 2017년 taewook. All rights reserved.
//

import Foundation
let midtownta : Midtownta = Midtownta()

class Midtownta {
    var tourname:[Attractions] = []
    init() {
        let ts = Attractions(name: "Times Square")
        let bp = Attractions(name: "Bryant Park")
        let hs = Attractions(name: "Herald Square")
        tourname += [ts, bp, hs]
    }
}
class Attractions {
    let name : String
    
    init(name:String) {
        self.name = name
    }
}
