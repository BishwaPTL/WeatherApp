//
//  WeatherAppTests.swift
//  WeatherAppTests
//
//  Created by Bishwajit Kalita on 02/01/24.
//

import XCTest
@testable import WeatherApp

final class WeatherAppTests: BaseTestCase {
    
    private var viewModel = DashboardViewModel()
    
    override func setUp() {
        super.setUp()
    }
    
    func testGetWeatherData() {
        viewModel.getWeatherData(for: "Sydney") { success in
            XCTAssertTrue(success)
        }
    }
    
    func testGenericErrorText() {
        XCTAssertEqual(viewModel.genericErrorText(), "Something went wrong, please try again.")
    }
}
