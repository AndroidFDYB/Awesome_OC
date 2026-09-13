//
//  Landmark.swift
//  FirstOcDemo
//
//  Created by zj015 on 2026/9/13.
//

import Foundation
import CoreLocation


struct Landmark : Identifiable {
    let id: ObjectIdentifier
    
    var latitude:Double
    var longitude:Double
    
    // compute 
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude:latitude,
            longitude:longitude
        )
    }
}
