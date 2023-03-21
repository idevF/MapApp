//
//  MapApp.swift
//  Map
//
//  Created by idevF on 20.03.2023.
//

import SwiftUI

@main
struct MapApp: App {
    @StateObject private var locationsViewModel = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(locationsViewModel)
        }
    }
}
