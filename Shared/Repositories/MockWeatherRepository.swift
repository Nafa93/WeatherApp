//
//  MockWeatherRepository.swift
//  WeatherApp (iOS)
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 21/02/2022.
//

import Foundation

class MockWeatherRepository: AnyWeatherRepository {
    func getWeather(latitude: String, longitude: String) async throws ->  CountryWeather {
        
        let coordinate = Coordinate(longitude: 100.0, latitute: 120.0)
        
        let weather = Weather(id: 0, description: "Few clouds", icon: "40d")
        
        let temperature = Temperature(current: 22, minimum: 17, maximum: 25)
        
        let wind  = Wind(speed: 102.3, direction: 102)
        
        return CountryWeather(coordinate: coordinate,
                              weather: [weather],
                              temperature: temperature,
                              wind: wind,
                              name: "Caballito")
    }
}
