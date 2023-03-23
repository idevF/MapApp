//
//  LocationsViewModel.swift
//  Map
//
//  Created by idevF on 21.03.2023.
//

import Foundation
import MapKit
import SwiftUI

final class LocationsViewModel: ObservableObject {
    // All loaded locations
    @Published var locations: [Location]
    
    // Current location on map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    // Current region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
    
    //
    @Published var sheetDetail: Location?
    
    init() {
        let locations = LocationDataServices.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(center: location.locationCoordinate, span: mapSpan)
        }
    }
    
    func goToTheCapital(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
        }
    }
}
