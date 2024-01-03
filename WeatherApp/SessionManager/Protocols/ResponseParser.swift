//
//  ResponseParser.swift
//  WeatherApp
//
//  Created by Bishwajit Kalita on 02/01/24.
//

import Foundation

protocol ResponseParser {
    func parse(_ data: Data) -> Any?
}
