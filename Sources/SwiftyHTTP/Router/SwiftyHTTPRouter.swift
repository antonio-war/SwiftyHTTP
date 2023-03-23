//
//  SwiftyHTTPRouter.swift
//  
//
//  Created by Antonio Guerra on 23/03/23.
//

import Foundation

protocol SwiftyHTTPRouter {
    var baseURL: URL? { get }
    var path: String { get }
    var method: SwiftyHTTPMethod { get }
    var headers: [SwiftyHTTPHeader] { get }
    var parameters: [SwiftyHTTPQueryParameter] { get }
    var body: SwiftyHTTPBody? { get }
    var request: URLRequest { get throws }
}

extension SwiftyHTTPRouter {
    private var encoder: JSONEncoder {
        return JSONEncoder()
    }
    
    var request: URLRequest {
        get throws {
            guard let baseURL, var url = URL(string: path, relativeTo: baseURL) else {
                throw URLError(.badURL)
            }
            
            url.append(queryItems: parameters.map({URLQueryItem(name: $0.key, value: $0.value)}))
            
            var request = URLRequest(url: url)
            request.httpMethod = method.rawValue
            
            for header in headers {
                request.setValue(header.value, forHTTPHeaderField: header.key)
            }
            
            if let body {
                request.httpBody = try encoder.encode(body)
            }
            
            return request
        }
    }
}
