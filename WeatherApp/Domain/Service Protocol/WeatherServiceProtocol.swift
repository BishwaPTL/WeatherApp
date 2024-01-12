//
//  WeatherServiceProtocol.swift
//  WeatherApp
//
//  Created by Bishwajit Kalita on 12/01/24.
//

import Foundation

protocol WeatherServiceProtocol {
    func getWeatherData(callback: @escaping serviceResponse)
}
