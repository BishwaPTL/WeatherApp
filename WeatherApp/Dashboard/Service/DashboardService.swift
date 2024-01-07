//
//  DashboardService.swift
//  WeatherApp
//
//  Created by Bishwajit Kalita on 02/01/24.
//

import Foundation

class DashboardService: BaseService {
    
    init(cityName: String) {
        super.init()
     //   self.requestUrl = "http://api.weatherapi.com/v1/forecast.json?key=\(Constants.apiKey)&q=\(cityName)"
        self.requestUrl = "\(Path.Api.getWeatherData)?key=\(Constants.apiKey)&q=\(cityName)"
        self.requestType = .GET
        self.contentType = .JSON
        self.responseParser = GenericParser<WeatherData>()
    }
}
