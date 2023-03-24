//
//  LocationDataServices.swift
//  Map
//
//  Created by idevF on 21.03.2023.
//

import Foundation

class LocationDataServices {
    
    // Data in JSON file assign to locations constant
    static let locations: [Location] = load("locationsData.json")

    /// Loads the data in the main bundle.
    ///
    /// This function checks the file exists or not in main bundle. And then checks if there is a content or not inside the file. If everything is ok, it decodes the JSON file.
    ///
    private static func load<T: Decodable>(_ filename: String) -> T {
        
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
}



