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
            Map(coordinateRegion: $locationsViewModel.mapRegion,
                annotationItems: locationsViewModel.locations,
                annotationContent: { location in
                MapAnnotation(coordinate: location.locationCoordinate) {
                    HStack {
                        NavigationButtonView(text: "PREV")
                            .onTapGesture {
                                print("PressedPREV")
                            }
                        
                        MapAnnotationButtonView()
                            .onTapGesture {
                                print("Pressed")
                                locationsViewModel.sheetDetail = location
                            }
                        NavigationButtonView(text: "NEXT")
                            .onTapGesture {
                                print("PressedNext")
                            }
                    }
                    .padding(.bottom, 120)
                }
            })
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
        .sheet(item: $locationsViewModel.sheetDetail, onDismiss: nil) { location in
            LocationDetailView(location: location)
        }
        
    }
    
}

struct Views_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}
