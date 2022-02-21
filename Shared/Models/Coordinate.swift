//
//  Coordinate.swift
//  WeatherApp (iOS)
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 20/02/2022.
//

import Foundation

struct Coordinate: Codable {
    let longitude: Double
    let latitute: Double
    
    enum CodingKeys: String, CodingKey {
        case longitude = "lon",
             latitute = "lat"
    }
}
