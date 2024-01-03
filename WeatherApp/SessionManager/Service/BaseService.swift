//
//  BaseService.swift
//  WeatherApp
//
//  Created by Bishwajit Kalita on 02/01/24.
//

import Foundation

class BaseService: Service {
    var baseUrl: String?
    var requestUrl: String = ""
    var requestType: RequestType = .GET
    var contentType: ContentType = .JSON
    var requestParams: [String : AnyObject]?
    var additionalHeaders: [String : String]?
    var timeout: TimeInterval = 30
    var responseParser: ResponseParser?
}
