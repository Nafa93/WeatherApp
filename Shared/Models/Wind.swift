//
//  Wind.swift
//  WeatherApp (iOS)
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 20/02/2022.
//

import Foundation

struct Wind: Codable {
    let speed: Double
    let direction: Int
    
    enum CodingKeys: String, CodingKey {
        case speed, direction = "deg"
    }
}
