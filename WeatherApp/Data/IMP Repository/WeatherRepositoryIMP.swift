//
//  WeatherRepositoryIMP.swift
//  WeatherApp
//
//  Created by Bishwajit Kalita on 18/01/24.
//

import Foundation

final class WeatherRepositoryIMP {
    
    private let remoteDataSource: WeatherDataSource
    
    init(remoteDataSource: WeatherDataSource) {
        self.remoteDataSource = remoteDataSource
    }
}

//MARK: WeatherRepository
extension WeatherRepositoryIMP: WeatherRepository {
    
    func getWeatherData(service: WeatherServiceProtocol, callback: @escaping serviceResponse) {
        remoteDataSource.getWeatherData(service: service, callback: callback)
    }
}
