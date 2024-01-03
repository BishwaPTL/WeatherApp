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
        self.baseUrl = "http://api.weatherapi.com/v1/current.json"
        self.requestUrl = ""
        self.requestType = .GET
        self.requestParams = [:]
    }
}
