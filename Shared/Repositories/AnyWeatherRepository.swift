//
//  AnyWeatherRepository.swift
//  WeatherApp (iOS)
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 21/02/2022.
//

import Foundation

protocol AnyWeatherRepository {
    func getWeather(latitude: String, longitude: String) async throws -> CountryWeather
}
