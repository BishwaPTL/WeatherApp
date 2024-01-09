//
//  BaseTestCase.swift
//  WeatherApp
//
//  Created by Bishwajit Kalita on 09/01/24.
//

import XCTest

class BaseTestCase: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        let mockClient = MockApiNetworkClient(mockClient: MockClientHandler())
        _ = NetworkManager.sharedInstance(mockClient)
    }
}

