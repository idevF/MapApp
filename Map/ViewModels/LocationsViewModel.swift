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
    
    func nextButtonPressed(location: Location) {
        // Find the current index of location
        guard let currentIndex = locations.firstIndex(where: { $0.id == location.id }) else {
            print("Could not find current index!")
            return
        }
        
        let nextIndex = currentIndex + 1
        // Check if the nextIndex is valid
        guard locations.indices.contains(nextIndex) else {
            // Next index is NOT valid
            // Restart from 0
            guard let firstLocation = locations.first else { return }
                goToTheCapital(location: firstLocation)
            return
        }
        // Next index IS valid
        let nextLocation = locations[nextIndex]
        goToTheCapital(location: nextLocation)
    }
    
    func previousButtonPressed(location: Location) {
        // Find the current index of location
        guard let currentIndex = locations.firstIndex(where: { $0.id == location.id }) else {
            print("Could not find current index!")
            return
        }
        
        let previousIndex = currentIndex - 1
        // Check if the previousIndex is valid
        guard locations.indices.contains(previousIndex) else {
            // Previous index is NOT valid
            // Restart from last
            guard let lastLocation = locations.last else { return }
                goToTheCapital(location: lastLocation)
            return
        }
        // Previous index IS valid
        let previousLocation = locations[previousIndex]
        goToTheCapital(location: previousLocation)
    }
}
