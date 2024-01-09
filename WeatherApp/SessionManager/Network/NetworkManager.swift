//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Bishwajit Kalita on 02/01/24.
//

import Foundation

class NetworkManager {
    
    private static var mockInstance: NetworkClientProtocol?
    private static var apiInstance = ApiNetworkClient()
    
    static func sharedInstance(_ mockInstance: NetworkClientProtocol? = nil) -> NetworkClientProtocol {
        if let mockInstance = mockInstance {
            self.mockInstance = mockInstance
            return mockInstance
        }
        
        if let mockInstance = NetworkManager.mockInstance {
            return mockInstance
        } else {
            return apiInstance
        }
    }
}
