//
//  GetIconConfiguration.swift
//  WeatherApp (iOS)
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 20/02/2022.
//

import Foundation

struct GetIconConfiguration: RequestConfiguration {
    var scheme: String {
        "https"
    }
    
    var host: String {
        "openweathermap.org"
    }
    
    var path: String {
        "/img/wn/\(iconName)@2x.png"
    }
    
    var parameters: [URLQueryItem]? {
        nil
    }
    
    var method: MethodType {
        .GET
    }
    
    var iconName: String
}
