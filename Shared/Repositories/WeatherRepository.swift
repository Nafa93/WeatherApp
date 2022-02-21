//
//  WeatherRepository.swift
//  WeatherApp (iOS)
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 20/02/2022.
//

import Foundation

class WeatherRepository: AnyWeatherRepository {
    func getWeather(latitude: String, longitude: String) async throws ->  CountryWeather {
        let configuration = GetWeatherConfiguration(latitude: latitude, longitude: longitude)
        
        let response: CountryWeather = try await ServiceLayer.request(configuration: configuration)

        return response
    }
}
