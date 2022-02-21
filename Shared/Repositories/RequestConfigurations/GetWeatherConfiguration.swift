//
//  GetWeatherConfiguration.swift
//  WeatherApp
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 18/02/2022.
//

import Foundation

struct GetWeatherConfiguration: RequestConfiguration {

    var openWeatherKey: String {
        guard let infoPlistPath = Bundle.main.url(forResource: "Info", withExtension: "plist") else {
            fatalError("This app doesn't work without an API")
        }
        
        do {
            let infoPlistData = try Data(contentsOf: infoPlistPath)
            
            if let dict = try PropertyListSerialization.propertyList(from: infoPlistData, options: [], format: nil) as? [String: Any] {
                return dict["API_KEY"] as? String ?? ""
            }
        } catch {
            print("The .plist file doesn't contain an API_KEY")
        }
        
        return ""
    }
    
    var host: String {
        "api.openweathermap.org"
    }
    
    var path: String {
        "/data/2.5/weather"
    }
    
    var parameters: [URLQueryItem]? {
        [
            URLQueryItem(name: "lat", value: latitude),
            URLQueryItem(name: "lon", value: longitude),
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "appid", value: openWeatherKey),
        ]
    }
    
    var method: MethodType {
        .GET
    }
    
    var latitude: String
    
    var longitude: String
}
