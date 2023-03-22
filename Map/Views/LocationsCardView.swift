//
//  LocationsCardView.swift
//  Map
//
//  Created by idevF on 21.03.2023.
//

import SwiftUI

struct LocationsCardView: View {
    
    @EnvironmentObject private var locationsViewModel: LocationsViewModel
    
    let location: Location
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 5.0) {
            Spacer()
            HStack(alignment: .center, spacing: 10.0) {
                Text(location.flag)
                    .font(.system(size: 60))
                    .shadow(
                        color: .primary,
                        radius: 10,
                        x: 0, y: 0)
                
                Text(location.name)
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.primary)
            }
            Spacer()
            Button {
                locationsViewModel.goToTheCapital(location: location)
            } label: {
                Text("Go to the Capital")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.primary)
                    .padding(10)
                    .padding(.horizontal, 15)
                    .background(Color(uiColor: .systemFill))
                    .cornerRadius(30)
            }
        }
        .frame(width: 300, height: 150, alignment: .top)
        .background(
            Capsule()
                .fill(.ultraThinMaterial)
                .shadow(
                    color: .primary,
                    radius: 10,
                    x: 0, y: 5)
        )
        .padding()

    }
}

struct LocationsCardView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsCardView(location: LocationDataServices.locations.first!)
            .environmentObject(LocationsViewModel())
    }
}
