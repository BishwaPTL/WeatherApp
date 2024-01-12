//
//  DashboardViewModel.swift
//  WeatherApp
//
//  Created by Bishwajit Kalita on 03/01/24.
//

import Foundation
import UIKit

class DashboardViewModel {
    
    var weatherData: WeatherData?
    
    func getWeatherData(for cityName: String, callback: @escaping (Bool) -> Void) {
        DashboardWorker.getWeatherData(service: DashboardService(cityName: cityName)) { (err, response) in
            if err != nil {
                callback(false)
            } else if let weatherData = response as? WeatherData {
                self.weatherData = weatherData
                callback(true)
            }
        }
    }
    
    func placeholderText() -> String {
        return Texts.placeholderText
    }
    
    func genericErrorText() -> String {
        Texts.genericErrorMessage
    }
    
    func numberOfSections() -> Int {
        return 3
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        return 1
    }
    
    func getLocalDate() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, dd MMMM"
        let yearString = dateFormatter.string(from: date)
        return yearString
    }
    
    var cityName: String {
        let cityName = "\(weatherData?.location.name ?? ""), \(weatherData?.location.country ?? "")"
        return cityName
    }
    
    var weatherCondition: String {
        return weatherData?.current.condition.text ?? ""
    }
    
    var tempWithUnits: String {
        var condition = ""
        let temperature = weatherData?.current.tempC ?? 0
        condition += Int(temperature) < 0 ? "−" : ""
        condition += String(abs(Int(temperature))) + "°C"
        return condition
    }
    
    var weatherIconUrl: URL? {
        let icon = weatherData?.current.condition.icon ?? ""
        guard let iconUrl = URL(string: "https:\(icon)") else {return nil}
        return iconUrl
    }
    
    func getForecastTime(at index: Int) -> String {
        var forecastTime = ""
        let time = weatherData?.forecast.forecastday.first?.hour[index].time ?? ""
        let timeArr = time.components(separatedBy: " ")
        forecastTime = timeArr.last ?? ""
        return forecastTime
    }
    
    func getForecastTempWithUnits(at index: Int) -> String {
        var condition = ""
        let temperature = weatherData?.forecast.forecastday.first?.hour[index].tempC ?? 0
        condition += Int(temperature) < 0 ? "−" : ""
        condition += String(abs(Int(temperature))) + "°C"
        return condition
    }
    
    func getForecastIconUrl(at index: Int) -> URL? {
        let icon = weatherData?.forecast.forecastday.first?.hour[index].condition.icon ?? ""
        guard let iconUrl = URL(string: "https:\(icon)") else {return nil}
        return iconUrl
    }
}
