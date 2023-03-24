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
    
    // Show location detail via sheet
    @Published var sheetDetail: Location?
    
    init() {
        let locations = LocationDataServices.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        self.updateMapRegion(location: locations.first!)
    }
    
    /// Updates location's MKCoordinateRegion.
    ///
    /// This function assigns the new location's  MKCoordinateRegion to mapRegion.
    ///
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(center: location.locationCoordinate, span: mapSpan)
        }
    }
    
    /// Navigates to the assigned location.
    ///
    /// This function assigns the location to mapLocation to navigate the new location.
    ///
    func goToTheCapital(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
        }
    }
    
    /// Navigates to the next location.
    ///
    /// This function finds the current index of location, adds one to current index, and checks the next  index is valid or not. If index is not valid, assigns first element of locations array to  go to the capital function. And navigates to next location.
    ///
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
    
    /// Navigates to the previous location.
    ///
    /// This function finds the current index of location, subtracts one from current index, and checks the previous index is valid or not. If index is not valid, assigns last element of locations array to  go to the capital function. And navigates to previous location.
    ///
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
