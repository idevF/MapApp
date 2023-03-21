//
//  LocationsViewModel.swift
//  Map
//
//  Created by idevF on 21.03.2023.
//

import Foundation
import MapKit

final class LocationsViewModel: ObservableObject {
    
    @Published var locations: [Location]
    
    init() {
        let locations = LocationDataServices.locations
        self.locations = locations
    }
    
//    func mapRegion(location: Location) {
//       return MKCoordinateRegion(center: location.locationCoordinate, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
//    }
    
}
