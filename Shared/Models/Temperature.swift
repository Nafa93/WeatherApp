//
//  Temperature.swift
//  WeatherApp (iOS)
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 20/02/2022.
//

import Foundation

struct Temperature: Codable {
    let current: Float
    let minimum: Float
    let maximum: Float
    
    enum CodingKeys: String, CodingKey {
        case current = "temp",
             minimum = "temp_min",
             maximum = "temp_max"
    }
}
