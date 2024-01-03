//
//  Service.swift
//  WeatherApp
//
//  Created by Bishwajit Kalita on 02/01/24.
//

import Foundation

enum RequestType: String {
    case GET
    case POST
}

enum ContentType: String {
    case XML = "application/xml"
    case JSON = "application/json"
    case NONE = ""
}

protocol Service {
    var baseUrl: String? { get }
    var requestUrl: String { get }
    var requestType: RequestType { get }
    var contentType: ContentType { get }
    var requestParams: [String: AnyObject]? { get }
    var additionalHeaders: [String: String]? { get }
    var timeout: TimeInterval { get }
}
