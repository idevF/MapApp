//
//  NavigationButtonView.swift
//  Map
//
//  Created by idevF on 23.03.2023.
//

import SwiftUI

struct NavigationButtonView: View {
    
    let text: String
    
    var body: some View {
        Text(text)
            .font(.system(size: 14, weight: .black))
            .foregroundColor(Color(uiColor: .systemTeal))
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .fill(.thinMaterial)
                    .shadow(
                        color: .primary,
                        radius: 10,
                        x: 0, y: -5)
            )
    }
}

struct NavigationButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationButtonView(text: "NEXT")
    }
}
