//
//  DashboardWorker.swift
//  WeatherApp
//
//  Created by Bishwajit Kalita on 03/01/24.
//

import Foundation

class DashboardWorker {
    
    static func getWeatherData(_ cityName: String, callback: @escaping serviceResponse) {
        let service = DashboardService(cityName: cityName)
        NetworkManager.sharedInstance().callService(service) { (err, response) in
            guard let res = response as? WeatherData else {
                callback(err, nil)
                return
            }
            callback(nil, res)
        }
    }
}
