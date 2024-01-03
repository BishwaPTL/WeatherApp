//
//  GenericParser.swift
//  WeatherApp
//
//  Created by Bishwajit Kalita on 03/01/24.
//

import Foundation

class GenericParser<T: Decodable>: ResponseParser {
    
    func parse(_ data: Data) -> Any? {
        do {
            let responseBody = try JSONDecoder().decode(T.self, from: data)
            return responseBody
        } catch let error {
            print("error parsing data: \(error.localizedDescription)")
            return nil
        }
    }
}
