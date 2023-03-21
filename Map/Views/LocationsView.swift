//
//  LocationsView.swift
//  Map
//
//  Created by idevF on 21.03.2023.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    @ObservedObject var vm = LocationsViewModel()
    
    @State private var region = MKCoordinateRegion(
        center:
    CLLocationCoordinate2D(latitude: 37.334_900,
                               longitude: -122.009_020),
                
            latitudinalMeters: 5750,
            longitudinalMeters: 5750
        )
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region)
                .ignoresSafeArea()
            VStack {
                Text(vm.locations.first?.name ?? "No name")
                    .font(.largeTitle)
                Text(vm.locations.last?.capitalName ?? "")
                Text("\(vm.locations.first?.coordinates.latitude ?? 0)")
                Spacer()
            }
            
        }
        
        
    }
}

struct Views_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
//            .environmentObject(LocationsViewModel())
    }
}
