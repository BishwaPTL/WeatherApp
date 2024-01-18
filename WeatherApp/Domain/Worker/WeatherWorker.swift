//
//  DashboardWorker.swift
//  WeatherApp
//
//  Created by Bishwajit Kalita on 03/01/24.
//

import Foundation

class WeatherWorker: WeatherDataSource {
    func getWeatherData(service: WeatherServiceProtocol, callback: @escaping serviceResponse) {
        service.getWeatherData(callback: callback)
    }
}
