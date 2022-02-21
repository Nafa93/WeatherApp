//
//  MockLocationManager.swift
//  WeatherApp (iOS)
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 21/02/2022.
//

import Foundation
import CoreLocation
import Combine
import UIKit

class MockLocationManager: AnyLocationManager, ObservableObject {
    @Published var locationStatus: CLAuthorizationStatus? = .authorizedAlways
    
    @Published var lastLocation: CLLocation? = CLLocation(latitude: 100.3, longitude: 20.5)
}
