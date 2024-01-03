//
//  RequestSerializer.swift
//  WeatherApp
//
//  Created by Bishwajit Kalita on 02/01/24.
//

import Foundation

protocol RequestSerializer {
    func serialize(_ object: Any) -> Data?
}
