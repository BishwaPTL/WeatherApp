//
//  Constants.swift
//  WeatherApp
//
//  Created by Bishwajit Kalita on 02/01/24.
//

import Foundation

struct Constants {
    static let contentType: String = "Content-Type"
    static let apiKey = "b191cd06f73049d1ae2124243233012"
}

struct VCIdentifiers {
    static let dashboardViewController = "DashboardViewController"
}

struct CellIdentifiers {
    static let currentWeatherTableViewCell = "CurrentWeatherTableViewCell"
    static let hourlyHeaderTableViewCell = "HourlyHeaderTableViewCell"
}

struct ApiPath {
    static let host             = "http://api.weatherapi.com/"
    static let apiVersion       = "v1/"
    static let baseURL          = host + apiVersion
    static var getWeatherData = "\(baseURL)forecast.json"
}

struct Texts {
    static let placeholderText = "Search for city"
    static let genericErrorMessage = "Something went wrong, please try again."
    static let cityName = "Sydney"
}
