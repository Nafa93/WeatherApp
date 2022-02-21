//
//  WeatherAppApp.swift
//  Shared
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 18/02/2022.
//

import SwiftUI

@main
struct WeatherApp: App {
    var body: some Scene {
        WindowGroup {
            WeatherView<LocationManager>(viewModel: weatherViewModel(),
                                         locationManager: LocationManager())
        }
    }
    
    func weatherViewModel() -> WeatherViewModel {
        let repository = WeatherRepository()
        let viewModel = WeatherViewModel(repository: repository)

        return viewModel
    }
}
