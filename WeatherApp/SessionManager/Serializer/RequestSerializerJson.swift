//
//  RequestSerializerJson.swift
//  WeatherApp
//
//  Created by Bishwajit Kalita on 02/01/24.
//

import Foundation

class RequestSerializerJson: RequestSerializer {
    func serialize(_ object: Any) -> Data? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: object, options: .prettyPrinted)
            return jsonData
        } catch let error as NSError {
            print("error serializing JSON object: \(error.localizedDescription)")
            return nil
        }
    }
}
