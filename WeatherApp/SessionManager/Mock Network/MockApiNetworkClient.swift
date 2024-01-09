//
//  MockApiNetworkClient.swift
//  WeatherApp
//
//  Created by Bishwajit Kalita on 09/01/24.
//

import Foundation

class MockApiNetworkClient: NetworkClientProtocol {
    
    var mockClient: MockNetworkClientProtocol
    
    init(mockClient: MockNetworkClientProtocol) {
        self.mockClient = mockClient
    }
    
    func callService(_ service: Service, withCallback serviceCallback: @escaping serviceResponse) {
        if let data = mockClient.loadJsonData(for: service), let parser = service.responseParser {
            if let response = parser.parse(data) {
                serviceCallback(nil, response)
            } else {
                let error = NSError(domain: "errordomain", code: -1, userInfo: [NSLocalizedDescriptionKey: "Could not parse response"])
                serviceCallback(error, nil)
            }
        }
    }
}
