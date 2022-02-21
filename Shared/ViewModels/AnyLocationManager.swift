//
//  AnyLocationManager.swift
//  WeatherApp (iOS)
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 21/02/2022.
//

import Foundation
import CoreLocation

protocol AnyLocationManager {
    var locationStatus: CLAuthorizationStatus? { get }
    var lastLocation: CLLocation? { get }
}
