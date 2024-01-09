//
//  MockClientHandler.swift
//  WeatherApp
//
//  Created by Bishwajit Kalita on 09/01/24.
//

import Foundation

class MockClientHandler: MockNetworkClientProtocol {
    
    func loadJsonData(for service: Service) -> Data? {
        var jsonFileName = ""
        if service.requestUrl.contains(ApiPath.getWeatherData) {
            jsonFileName = "WeatherData"
        }
        return loadData(for: jsonFileName)
    }
    
    private func loadData(for fileName: String) -> Data? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let jsonData = try Data(contentsOf: url)
                return jsonData
            } catch {
                return nil
            }
        }
        return nil
    }
}
