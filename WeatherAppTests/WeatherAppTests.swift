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
        setupMockData()
    }
    
    private func setupMockData() {
        if let url = Bundle.main.url(forResource: "WeatherData", withExtension: "json") {
            do {
                let jsonData = try Data(contentsOf: url)
                let jsonDecoder = JSONDecoder()
                let result = try jsonDecoder.decode(WeatherData.self, from: jsonData)
                viewModel.weatherData = result
            } catch {
                print("error:\(error)")
            }
        }
    }
    
    func testGetWeatherData() {
        viewModel.getWeatherData(for: "Sydney") { success in
            XCTAssertTrue(success)
        }
    }
    
    func testGenericErrorText() {
        XCTAssertEqual(viewModel.genericErrorText(), "Something went wrong, please try again.")
    }
    
    func testGetForecastTime() {
        let forecastTime = viewModel.getForecastTime(at: 1)
        XCTAssertEqual(forecastTime, "23:00")
    }
    
    func testGetForecastTempWithUnits() {
        let forecastTemp = viewModel.getForecastTempWithUnits(at: 1)
        XCTAssertEqual(forecastTemp, "20°C")
    }
    
    func testGetForecastIconUrl() {
        let iconUrl = viewModel.getForecastIconUrl(at: 1)
        XCTAssertEqual(iconUrl?.absoluteString, "https://cdn.weatherapi.com/weather/64x64/night/119.png")
    }
}
