//
//  DashboardViewModel.swift
//  WeatherApp
//
//  Created by Bishwajit Kalita on 03/01/24.
//

import Foundation

class DashboardViewModel {
    
    var weatherData: WeatherData?
    
    func getWeatherData(for cityName: String, callback: @escaping (Bool) -> Void) {
        DashboardWorker.getWeatherData(for: cityName) { (err, response) in
            if err != nil {
                callback(false)
            } else if let weatherData = response as? WeatherData {
                self.weatherData = weatherData
                callback(true)
            }
        }
    }
    
    func placeholderText() -> String? {
        return Texts.placeholderText
    }
}
