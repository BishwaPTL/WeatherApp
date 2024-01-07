//
//  SessionManager.swift
//  WeatherApp
//
//  Created by Bishwajit Kalita on 02/01/24.
//

import Foundation

typealias serviceResponse = (NSError?, Any?) -> Void

class SessionManager: NSObject {
    
    static let sharedInstance = SessionManager()
    fileprivate static let errorDomain = "errordomain"
    
    fileprivate lazy var queue: OperationQueue = {
        let queue = OperationQueue()
        queue.name = "Service Queue"
        return queue
    }()
    
    private override init() {
        super.init()
    }
    
    func startService(_ service: Service, withResponseObject serviceResponse: @escaping serviceResponse) {
        let request = createRequest(service)
        let dataTask = createSession().dataTask(with: request) { (data, response, error) in
            self.processResponseHandler(service, data: data, response: response, error: error, serviceResponse: serviceResponse)
        }
        dataTask.resume()
    }
    
    fileprivate func processResponseHandler(_ service: Service, data: Data?, response: URLResponse?, error: Error?, serviceResponse: @escaping serviceResponse) {
        if let err = error as? NSError {
            serviceResponse(err, nil)
            return
        }
        
        guard let urlResopnse = response as? HTTPURLResponse else {
            let error = NSError(domain: SessionManager.errorDomain, code: -1, userInfo: [NSLocalizedDescriptionKey: "No response returned from server."])
            serviceResponse(error, nil)
            return
        }
        
        guard let responseData = data else {
            let error = NSError(domain: SessionManager.errorDomain, code: -1, userInfo: [NSLocalizedDescriptionKey: "No data returned from server."])
            serviceResponse(error, nil)
            return
        }
        
        if urlResopnse.statusCode > 299 {
            let error = NSError(domain: SessionManager.errorDomain, code: urlResopnse.statusCode, userInfo: [NSLocalizedDescriptionKey: "Error - use 'Response' key for response data", "Response": responseData])
            serviceResponse(error, nil)
            return
        }
        
        // Custom parser
        if let parser = service.responseParser {
            if let response = parser.parse(responseData) {
                serviceResponse(nil, response)
            } else {
                let error = NSError(domain: SessionManager.errorDomain, code: urlResopnse.statusCode, userInfo: [NSLocalizedDescriptionKey: "Could not parse response", "Response": responseData])
                serviceResponse(error, nil)
                return
            }
        } else {
            // Use default parser
            if let response = parseByContentType(service.contentType, data: responseData) {
                serviceResponse(nil, response)
            } else {
                let error = NSError(domain: SessionManager.errorDomain, code: urlResopnse.statusCode, userInfo: [NSLocalizedDescriptionKey: "Could not parse response", "Response": responseData])
                serviceResponse(error, nil)
                return
            }
        }
    }
    
    fileprivate func createSession() -> URLSession {
        return URLSession(configuration: .default, delegate: self, delegateQueue: queue)
    }
    
    fileprivate func createRequest(_ service: Service) -> URLRequest {
        let request = NSMutableURLRequest()
        // do not store request responses in cache.db
        request.cachePolicy = .reloadIgnoringLocalCacheData
        request.url = URL(string: service.requestUrl)
        request.httpMethod = service.requestType.rawValue
        request.timeoutInterval = service.timeout
        
        if let additionalHeaders = service.additionalHeaders {
            for (key, value) in additionalHeaders {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        if service.contentType.rawValue != "" {
            request.setValue(service.contentType.rawValue, forHTTPHeaderField: Constants.contentType)
        }
        
        guard let requestParams = service.requestParams else {
            return request as URLRequest
        }
        
        if requestParams.count > 0 {
            switch service.contentType {
            case .JSON:
                if let data = RequestSerializerJson().serialize(requestParams as Any) {
                    request.httpBody = data
                }
            case .XML: break
            case .NONE: break
            }
        }
        return request as URLRequest
    }
    
    fileprivate func parseByContentType(_ contentType: ContentType, data: Data) -> Any? {
        switch contentType {
        case .JSON:
            return ResponseParserJson().parse(data)
        case .XML:
            return XMLParser(data: data)
        default:
            return data
        }
    }
}

// MARK: URLSession Delegate
extension SessionManager: URLSessionDelegate {

    func urlSession(_ session: URLSession, task: URLSessionTask, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
    }
}