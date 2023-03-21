//
//  LocationsViewModel.swift
//  Map
//
//  Created by idevF on 21.03.2023.
//

import Foundation


final class LocationsViewModel: ObservableObject {
    
    @Published var locations: [Location]
    
    init() {
        let locations = LocationDataServices.locations
        self.locations = locations
    }
    
}
