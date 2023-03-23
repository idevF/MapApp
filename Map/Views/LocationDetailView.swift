//
//  LocationDetailView.swift
//  Map
//
//  Created by idevF on 23.03.2023.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    
    @EnvironmentObject private var locationsViewModel: LocationsViewModel
    
    let location: Location
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20.0) {
                // Header
                HStack(alignment: .center, spacing: 20.0) {
                    Text(location.flag)
                        .font(.system(size: 40))
                    
                    Text(location.name)
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(.primary)
                    Spacer()
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
                .background(alignment: .center, content: {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.ultraThinMaterial)
                })
                .overlay(alignment: .trailing) {
                    Button {
                        locationsViewModel.sheetDetail = nil
                    } label: {
                        Image(systemName: "xmark.square")
                            .symbolRenderingMode(.monochrome)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.secondary)
                            .padding()
                    }
                }
                
                // Map
                Map(coordinateRegion: .constant(MKCoordinateRegion(
                    center: location.locationCoordinate,
                    span: MKCoordinateSpan(latitudeDelta: 3.0, longitudeDelta: 3.0))),
                    annotationItems: [location]) { location in
                    MapMarker(coordinate: location.locationCoordinate, tint: .secondary)
                }
                    .allowsHitTesting(false)
                    .aspectRatio(2, contentMode: .fit)
                    .cornerRadius(8)
                
                // Overview
                Section {
                    HStack {
                        Text("Capital:")
                        Text(location.capitalName)
                            .fontWeight(.regular)
                    }
                    HStack {
                        Text("Official EU language:")
                        Text(location.officialLanguage)
                            .fontWeight(.regular)
                    }
                    HStack {
                        Text("EU member country:")
                        Text(location.memberSince)
                            .fontWeight(.regular)
                    }
                } header: {
                    Text("Overview")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .underline()
                        .foregroundColor(.primary)
                }
                .font(.headline)
                
                // Political system
                Section {
                    Text(location.politicalsystem)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(5)
                } header: {
                    Text("Political system")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .underline()
                        .foregroundColor(.primary)
                }
                .font(.headline)
                
                // Trade and economy
                Section {
                    Text(location.tradeAndEconomy)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(5)
                } header: {
                    Text("Trade and economy")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .underline()
                        .foregroundColor(.primary)
                } footer: {
                    Text("Source: The European Union website")
                        .fontWeight(.thin)
                        .italic()
                }
                .font(.headline)
                
                if let url = URL(string: location.euLink) {
                    Link("Read more on the European Union website", destination: url)
                        .font(.headline)
                        .fontWeight(.medium)
                        .italic()
                }
                
                // Facts
                Section {
                    HStack {
                        Text("Population:")
                        Text("\(location.facts.population.formatted())")
                            .fontWeight(.regular)
                    }
                    HStack {
                        Text("Inflation rate:")
                        Text("\(location.facts.inflationRate.formatted())%")
                            .fontWeight(.regular)
                    }
                    HStack {
                        Text("GDP per capita:")
                        Text("\(location.facts.gdpPerCapita.formatted())€")
                            .fontWeight(.regular)
                    }
                    HStack {
                        Text("Renewable energy:")
                        Text("\(location.facts.renewableEnergy.formatted())%")
                            .fontWeight(.regular)
                    }
                    HStack {
                        Text("Electricity prices:")
                        Text("\(location.facts.electricityPrices.formatted())€")
                            .fontWeight(.regular)
                    }
                } header: {
                    Text("Facts")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .underline()
                        .foregroundColor(.primary)
                } footer: {
                    Text("Source: eurostat")
                        .fontWeight(.thin)
                        .italic()
                }
                .font(.headline)
                
                if let url = URL(string: location.facts.eurostatLink) {
                    Link("Read more on the eurostat website", destination: url)
                        .font(.headline)
                        .fontWeight(.medium)
                        .italic()
                }
            }
            .padding()
            .background(.ultraThinMaterial)
        }
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView(location: LocationsViewModel().locations.first!)
            .environmentObject(LocationsViewModel())
    }
}
