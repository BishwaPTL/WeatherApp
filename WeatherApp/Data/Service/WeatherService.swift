//
//  DashboardService.swift
//  WeatherApp
//
//  Created by Bishwajit Kalita on 02/01/24.
//

import Foundation

class WeatherService: BaseService {
    init(cityName: String) {
        super.init()
        let encodedCityName = cityName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        self.requestUrl = "\(ApiPath.getWeatherData)?key=\(Constants.apiKey)&q=\(encodedCityName)"
        self.requestType = .GET
        self.contentType = .JSON
        self.responseParser = GenericParser<WeatherData>()
        self.networkManager = NetworkManager.sharedInstance()
    }
}

//MARK: WeatherServiceProtocol
extension WeatherService: WeatherServiceProtocol {
    func getWeatherData(callback: @escaping serviceResponse) {
        self.networkManager?.callService(self, withCallback: { err, response in
            callback(err, response)
        })
    }
}
