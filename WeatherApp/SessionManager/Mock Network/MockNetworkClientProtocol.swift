//
//  MockNetworkClientProtocol.swift
//  WeatherApp
//
//  Created by Bishwajit Kalita on 09/01/24.
//

import Foundation

protocol MockNetworkClientProtocol {
    func loadJsonData(for service: Service) -> Data?
}
