//
//  NetworkClientProtocol.swift
//  WeatherApp
//
//  Created by Bishwajit Kalita on 02/01/24.
//

import Foundation

protocol NetworkClientProtocol {
    
    /// initiate a service call
    func callService(_ service: Service, withCallback serviceCallback: @escaping serviceResponse)
}
