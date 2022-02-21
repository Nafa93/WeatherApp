//
//  WeatherViewModel.swift
//  WeatherApp (iOS)
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 20/02/2022.
//

import Foundation
import CoreLocation

class WeatherViewModel: NSObject, ObservableObject {
    @Published var isAlertShown: Bool = false
    
    @Published private var countryWeather: CountryWeather?
    
    @Published var isLoading: Bool = true
    
    private var repository: AnyWeatherRepository
    
    var countryName: String {
        countryWeather?.name ?? "Unknown Country"
    }
    
    var currentTemperature: String {
        "\(Int(ceil(countryWeather?.temperature.current ?? 0.0)))°"
    }
    
    var weatherDescription: String {
        countryWeather?.weather.first?.description.firstUppercased ?? "-"
    }
    
    var minimumAndMaximumTemperature: String {
        let minimum = Int(ceil(countryWeather?.temperature.minimum ?? 0.0))
        let maximum = Int(ceil(countryWeather?.temperature.maximum ?? 0.0))
        
        return "Low: \(minimum)° High: \(maximum)°"
    }
    
    var windSpeedAndDirection: String {
        let speed = countryWeather?.wind.speed ?? 0
        let direction = countryWeather?.wind.direction ?? 0
        
        return "Wind: \(speed) (\(direction))"
    }
    
    var iconName: String {
        countryWeather?.weather.first?.icon ?? ""
    }
    
    func getWeather(latitude: Double?, longitude: Double?) {
        guard let latitude = latitude,
              let longitude = longitude,
              countryWeather == nil,
              !isAlertShown else {
            return
        }
        
        isLoading = true
        
        Task {
            do {
                let weather = try await repository.getWeather(latitude: "\(latitude)",
                                                              longitude: "\(longitude)")
                
                DispatchQueue.main.async {
                    self.countryWeather = weather
                    self.isLoading = false
                }
            } catch {
                DispatchQueue.main.async {
                    self.isAlertShown = true
                    self.isLoading = false
                }
            }
        }
    }
    
    func getIconUrl(iconName: String) -> URL? {
        guard !iconName.isEmpty else {
            return nil
        }
        
        let configuration = GetIconConfiguration(iconName: iconName)
        
        guard let url = ServiceLayer.getUrl(from: configuration) else {
            return nil
        }
        
        return url
    }
    
    func isLocationServiceEnabled(_ locationStatus: CLAuthorizationStatus?) -> Bool {
        guard let locationStatus = locationStatus else {
            return false
        }
        
        switch locationStatus {
        case .notDetermined, .restricted, .denied:
            return false
        case .authorizedAlways, .authorizedWhenInUse, .authorized:
            return true
        default:
            return false
        }
    }
    
    init(repository: AnyWeatherRepository) {
        self.repository = repository
    }
}
