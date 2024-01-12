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
        self.requestUrl = "\(ApiPath.getWeatherData)?key=\(Constants.apiKey)&q=\(cityName)"
        self.requestType = .GET
        self.contentType = .JSON
        self.responseParser = GenericParser<WeatherData>()
    }
}

//MARK: WeatherServiceProtocol
extension DashboardService: WeatherServiceProtocol {
    func getWeatherData(callback: @escaping serviceResponse) {
        NetworkManager.sharedInstance().callService(self) { (err, response) in
            guard let res = response as? WeatherData else {
                callback(err, nil)
                return
            }
            callback(nil, res)
        }
    }
}
