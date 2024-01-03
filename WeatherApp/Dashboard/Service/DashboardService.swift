//
//  DashboardService.swift
//  WeatherApp
//
//  Created by Bishwajit Kalita on 02/01/24.
//

import Foundation

class DashboardService: BaseService {
    
    let apiKey = "b191cd06f73049d1ae2124243233012"
    
    init(cityName: String) {
        super.init()
        self.requestUrl = "http://api.weatherapi.com/v1/current.json?key=\(apiKey)&q=\(cityName)"
        self.requestType = .GET
        self.contentType = .JSON
        self.responseParser = GenericParser<WeatherData>()
    }
}
