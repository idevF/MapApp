//
//  LocationsView.swift
//  Map
//
//  Created by idevF on 21.03.2023.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    // MARK: PROPERTIES
    
    @EnvironmentObject private var locationsViewModel: LocationsViewModel
    
    // MARK: BODY
    
    var body: some View {
        ZStack {
            mapLayer
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                scrollViewLayer
                    .offset(y: 20)
            }
        }
        .sheet(item: $locationsViewModel.sheetDetail, onDismiss: nil) { location in
            LocationDetailView(location: location)
        }
        
    }
    
}

// MARK: PREVIEW

struct Views_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}

// MARK: COMPONENTS

extension LocationsView {
    
    private var mapLayer: some View {
        Map(coordinateRegion: $locationsViewModel.mapRegion,
            annotationItems: locationsViewModel.locations,
            annotationContent: { location in
            MapAnnotation(coordinate: location.locationCoordinate) {
                HStack {
                    Button {
                        locationsViewModel.previousButtonPressed(location: location)
                    } label: {
                        NavigationButtonView(text: "PREV")
                    }

                    MapAnnotationButtonView()
                        .onTapGesture {
                            locationsViewModel.sheetDetail = location
                        }
                    
                    Button {
                        locationsViewModel.nextButtonPressed(location: location)
                    } label: {
                        NavigationButtonView(text: "NEXT")
                    }
                }
                .padding(.bottom, 120)
            }
        })
    }
    
    private var scrollViewLayer: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { proxy in
                HStack(spacing: 10.0) {
                    ForEach(locationsViewModel.locations) { location in
                        LocationsCardView(location: location)
                            .padding(.horizontal, 30)
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
    }
}
