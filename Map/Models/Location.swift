//
//  Location.swift
//  Map
//
//  Created by idevF on 21.03.2023.
//

import Foundation
import MapKit

struct Location: Codable {
    let name: String

    let capitalName: String
    let officialLanguage: String
    let memberSince: String
    let politicalsystem: String
    let tradeAndEconomy: String
    let euLink: String
    let facts: Facts
    
    struct Facts: Codable {
        let population: Int
        let inflationRate: Double
        let gdpPerCapita: Int
        let renewableEnergy: Double
        let electricityPrices: Double
        let eurostatLink: String
    }
    
    let coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
    struct Coordinates: Codable {
        let latitude: Double
        let longitude: Double
    }
}


