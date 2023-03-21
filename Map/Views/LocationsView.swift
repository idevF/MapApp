//
//  LocationsView.swift
//  Map
//
//  Created by idevF on 21.03.2023.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var locationsViewModel: LocationsViewModel
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 52.51874, longitude: 13.40802),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))

    var body: some View {
        ZStack {
            Map(coordinateRegion: $region)
                .ignoresSafeArea()
            
            
            VStack {
                Spacer()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(locationsViewModel.locations) { location in
                            LocationsCardView(location: location)
                        }
                    }
                    .background(Color(uiColor: .systemFill))
                }
            }
        }
        
        
    }

}

struct Views_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}
