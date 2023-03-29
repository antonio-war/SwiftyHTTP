//
//  SwiftyHTTPRequest.swift
//  
//
//  Created by Antonio Guerra on 23/03/23.
//

import Foundation

public typealias SwiftyHTTPRequestBody = Encodable

public protocol SwiftyHTTPRequest: URLRequestRepresentable {
    var baseURL: URL? { get }
    var path: String { get }
    var method: SwiftyHTTPMethod { get }
    var headers: [SwiftyHTTPHeader] { get }
    var parameters: [SwiftyHTTPQueryParameter] { get }
    var body: SwiftyHTTPRequestBody? { get }
}

public extension SwiftyHTTPRequest {    
    var request: URLRequest {
        get throws {
            guard let baseURL, var url = (path == "" ? URL(string: "/", relativeTo: baseURL) : URL(string: path, relativeTo: baseURL)) else {
                throw URLError(.badURL)
            }
            
            if parameters.count > 0 {
                if #available(iOS 16.0, *) {
                    url.append(queryItems: parameters.map({URLQueryItem(name: $0.key, value: $0.value)}))
                } else {
                    if var components = URLComponents(url: url, resolvingAgainstBaseURL: true) {
                        components.queryItems = parameters.map({URLQueryItem(name: $0.key, value: $0.value)})
                        if let composed = components.url {
                            url = composed
                        }
                    }
                }
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = method.rawValue
            
            for header in headers {
                request.setValue(header.value, forHTTPHeaderField: header.key)
            }
            
            if let body {
                request.httpBody = try JSONEncoder().encode(body)
            }
            
            return request
        }
    }
}
