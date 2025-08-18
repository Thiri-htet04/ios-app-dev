//
//  ContentModel.swift
//  Attractions
//
//  Created by Thiri Htet on 17/08/2025.
//

import Foundation
import CoreLocation 

struct ContentModel: Identifiable{
    var id = UUID()
    var name : String
    var imageName : String
    var place: String
    var city : String
    var description : String
    var latitude: Double
    var longitude: Double
    
    var coordinate : CLLocationCoordinate2D {
        .init(latitude: latitude, longitude: longitude)
    }
}
