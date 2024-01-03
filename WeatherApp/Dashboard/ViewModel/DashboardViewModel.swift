//
//  DashboardViewModel.swift
//  WeatherApp
//
//  Created by Bishwajit Kalita on 03/01/24.
//

import Foundation

class DashboardViewModel {
    
    func getWeatherData() {
        DashboardWorker.getWeatherData("Sydney") { (err, response) in
            print(err)
            print(response)
        }
    }
}
