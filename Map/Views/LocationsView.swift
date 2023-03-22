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


    var body: some View {
        ZStack {
            Map(coordinateRegion: $locationsViewModel.mapRegion)
                .ignoresSafeArea()
            
            
            VStack {
                Spacer()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 50.0) {
                        ForEach(locationsViewModel.locations) { location in
                            LocationsCardView(location: location)
                        }
                    }
                    .background(Color(uiColor: .systemFill))
                }
                .offset(y: 20)
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
