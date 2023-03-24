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
                                locationsViewModel.previousButtonPressed(location: location)
                            }
                        
                        MapAnnotationButtonView()
                            .onTapGesture {
                                print("Pressed")
                                locationsViewModel.sheetDetail = location
                            }
//                            .rotationEffect(Angle(degrees: locationsViewModel.mapLocation == location ? 360.0 : 0.0), anchor: .bottom)
//                            .scaleEffect(locationsViewModel.mapLocation == location ? 1.5 : 1.0)
//                            .animation(.easeInOut(duration: 2.0).repeatForever(), value: location.id)
                        
                        NavigationButtonView(text: "NEXT")
                            .onTapGesture {
                                print("PressedNext")
                                locationsViewModel.nextButtonPressed(location: location)
                            }

                    }
                    .padding(.bottom, 120)

                }
            })
            .ignoresSafeArea()
            
            
            VStack {
                Spacer()
                ScrollView(.horizontal, showsIndicators: false) {
                    ScrollViewReader { proxy in
                        HStack(spacing: 50.0) {
                            ForEach(locationsViewModel.locations) { location in
                                LocationsCardView(location: location)
//                                    .id(location.id)
                            }
                        }
                        .background(Color(uiColor: .systemFill))
                        .onChange(of: locationsViewModel.mapLocation.id) { newValue in
                            withAnimation(.spring()) {
                                proxy.scrollTo(newValue, anchor: .center)
                            }
                        }
                    }
                }
                .offset(y: 20)
            }
            
//            VStack {
//                Spacer()
//                ScrollView(.horizontal, showsIndicators: false) {
//                    HStack(spacing: 50.0) {
//                        ForEach(locationsViewModel.locations) { location in
//                            LocationsCardView(location: location)
//                        }
//                    }
//                    .background(Color(uiColor: .systemFill))
//                }
//                .offset(y: 20)
//            }
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
