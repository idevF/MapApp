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
//                                .padding(.bottom, 160)
                            
                            MapAnnotationView()
                            //                            .scaleEffect(locationsViewModel.mapLocation == location ? 1.2 : 0.7)
                            
                            //                                .animation(
                            //                                    .easeInOut(duration: 2).repeatCount(3),
                            //                                    value: location)
                                .onTapGesture {
                                    print("Pressed")
                                }
//                                .padding(.bottom, 120)
                            NavigationButtonView(text: "NEXT")
                                .onTapGesture {
                                    print("PressedNext")
                                }
//                                .padding(.bottom, 160)
                        }
                        .padding(.bottom, 120)
                }
    
            })
                .ignoresSafeArea()
            
            
            VStack {
//                Text(locationsViewModel.mapLocation.flag + " " + locationsViewModel.mapLocation.capitalName + ", " + locationsViewModel.mapLocation.name)
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
