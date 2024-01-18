//
//  WeatherRepository.swift
//  WeatherApp
//
//  Created by Bishwajit Kalita on 18/01/24.
//

import Foundation

protocol WeatherRepository {
    func getWeatherData(service: WeatherServiceProtocol, callback: @escaping serviceResponse)
}
