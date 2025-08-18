//
//  MapView.swift
//  Attractions
//
//  Created by Thiri Htet on 16/08/2025.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    let coordinate : CLLocationCoordinate2D
    
    var location : MKCoordinateRegion {
        .init(center : coordinate,
              span: .init(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
        
//        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 18.559035692695247, longitude: 98.48015588963789), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    }
    
    var body: some View {
        Map(initialPosition: .region(location))
    }
}

#Preview {
    MapView(coordinate: contents[0].coordinate)
}
