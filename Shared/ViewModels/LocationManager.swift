//
//  LocationManager.swift
//  WeatherApp (iOS)
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 20/02/2022.
//

import Foundation
import CoreLocation
import Combine

class LocationManager: NSObject, AnyLocationManager, ObservableObject, CLLocationManagerDelegate {
    
    @Published var locationStatus: CLAuthorizationStatus?
    
    @Published var lastLocation: CLLocation?
    
    private let locationManager = CLLocationManager()

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        locationStatus = status
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        lastLocation = location
    }
}
