//
//  CountryWeather.swift
//  WeatherApp (iOS)
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 20/02/2022.
//

import Foundation

struct CountryWeather: Codable {
    let coordinate: Coordinate
    let weather: [Weather]
    let temperature: Temperature
    let wind: Wind
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case coordinate = "coord",
             weather,
             temperature = "main",
             wind,
             name
    }
}
