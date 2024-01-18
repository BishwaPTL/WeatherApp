//
//  WeatherRepositoryIMP.swift
//  WeatherApp
//
//  Created by Bishwajit Kalita on 18/01/24.
//

import Foundation

final class WeatherRepositoryIMP {
    
    private let dataSource: WeatherDataSource
    
    init(dataSource: WeatherDataSource) {
        self.dataSource = dataSource
    }
}

//MARK: WeatherRepository
extension WeatherRepositoryIMP: WeatherRepository {
    
    func getWeatherData(service: WeatherServiceProtocol, callback: @escaping serviceResponse) {
        dataSource.getWeatherData(service: service, callback: callback)
    }
}
