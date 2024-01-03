//
//  ApiNetworkClient.swift
//  WeatherApp
//
//  Created by Bishwajit Kalita on 02/01/24.
//

import Foundation

class ApiNetworkClient: NetworkClientProtocol {
    
    func callService(_ service: Service, withCallback serviceCallback: @escaping serviceResponse) {
        SessionManager.sharedInstance.startService(service) { (error, result) in
           serviceCallback(error, result)
        }
    }
}
