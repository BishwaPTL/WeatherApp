//
//  ResponseParserJson.swift
//  WeatherApp
//
//  Created by Bishwajit Kalita on 02/01/24.
//

import Foundation

class ResponseParserJson: ResponseParser {
    func parse(_ data: Data) -> Any? {
        do {
            let responseBody = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            return responseBody
        } catch let error as NSError {
            print("error parsing data: \(error.localizedDescription)")
            return nil
        }
    }
}
