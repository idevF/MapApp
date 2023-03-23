//
//  MapAnnotationView.swift
//  Map
//
//  Created by idevF on 22.03.2023.
//

import SwiftUI

struct MapAnnotationView: View {
    
    var body: some View {
        VStack {
            Text("Learn More")
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(Color(uiColor: .systemPink))
                .underline()
                .frame(width: 120, height: 40)
                .background(
                    Capsule()
                        .fill(.thinMaterial)
                        .shadow(
                            color: .primary,
                            radius: 10,
                            x: 0, y: -5)
                )

            Image(systemName: "mappin.and.ellipse")
                .symbolRenderingMode(.multicolor)
                .resizable()
                .scaledToFit()
                .frame(width: 35, height: 35)
                .background(Color.green.opacity(0.3))
            
        }
        .background(Color.gray.opacity(0.3))
    }
}

struct MapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        MapAnnotationView()
    }
}
