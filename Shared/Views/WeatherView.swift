//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 18/02/2022.
//

import SwiftUI

struct WeatherView<LocationManagerType: AnyLocationManager>: View where LocationManagerType: ObservableObject {
    @StateObject var viewModel: WeatherViewModel
    @StateObject var locationManager: LocationManagerType
    
    var body: some View {
        if viewModel.isLocationServiceEnabled(locationManager.locationStatus) {
            ZStack {
                Color.black
                
                VStack(spacing: 24) {
                    Text(viewModel.countryName)
                        .font(.largeTitle)
                    
                    AsyncImage(url: viewModel.getIconUrl(iconName: viewModel.iconName)) { phase in
                        
                        if let image = phase.image {
                            image
                                .interpolation(.none)
                        } else if phase.error != nil {
                            Image(systemName: "exclamationmark.triangle.fill")
                                .resizable()
                                .foregroundColor(.red)
                        } else {
                            ProgressView()
                                .progressViewStyle(
                                    CircularProgressViewStyle(tint: Color.white)
                                )
                        }
                    }
                    .frame(width: 100, height: 100)
                    
                    Text(viewModel.currentTemperature)
                        .font(.title)
                        .bold()
                    
                    Text(viewModel.weatherDescription)
                        .font(.title3)
                        .bold()
                    
                    Text(viewModel.minimumAndMaximumTemperature)
                        .font(.title3)
                    
                    Text(viewModel.windSpeedAndDirection)
                        .font(.title3)
                }
                .redacted(reason: viewModel.isLoading ? .placeholder : [])
            }
            .alert("Something went wrong", isPresented: $viewModel.isAlertShown, actions: {
                Text("Ok")
            })
            .onChange(of: locationManager.lastLocation) { newValue in
                viewModel.getWeather(latitude: newValue?.coordinate.latitude,
                                     longitude: newValue?.coordinate.longitude)
            }
            .foregroundColor(.white)
            .edgesIgnoringSafeArea(.vertical)
        } else {
            ZStack {
                Color.black
                    
                Text("Please, enable location tracking for this to work")
                    .foregroundColor(.white)
            }
            .edgesIgnoringSafeArea(.vertical)
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static let locationManager = MockLocationManager()
    
    static let repository = MockWeatherRepository()
    
    static let viewModel = WeatherViewModel(repository: repository)
    
    static var previews: some View {
        WeatherView<MockLocationManager>(viewModel: viewModel,
                                         locationManager: locationManager)
    }
}
