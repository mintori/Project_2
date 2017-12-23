//
//  Bank.swift
//  project
//
//  Created by SWUCOMPUTER on 2017. 12. 23..
//  Copyright © 2017년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit


class Bank: NSObject, MKAnnotation{
    var title: String?
    var coordinate: CLLocationCoordinate2D
    
    init (title: String, latitude: Double, longitude: Double)
    {
        self.title = title
        self.coordinate = CLLocationCoordinate2D()
        self.coordinate.latitude = latitude
        self.coordinate.longitude = longitude
    }
    
}
