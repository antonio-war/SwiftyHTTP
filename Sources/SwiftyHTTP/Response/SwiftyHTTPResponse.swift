//
//  SwiftyHTTPResponse.swift
//  
//
//  Created by Antonio Guerra on 25/03/23.
//

import Foundation

public typealias SwiftyHTTPResponseBody = Decodable

public struct SwiftyHTTPResponse<Body: SwiftyHTTPResponseBody>: URLResponseRepresentable {
    
    private var urlResponse: HTTPURLResponse
    public var body: Body
    
    public var url: URL? {
        urlResponse.url
    }
    
    public var statusCode: Int {
        urlResponse.statusCode
    }
    
    public var headers: [AnyHashable: Any] {
        urlResponse.allHeaderFields
    }

    public init(urlResponse: HTTPURLResponse, body: Body) {
        self.urlResponse = urlResponse
        self.body = body
    }

    public func callAsFunction() throws -> HTTPURLResponse {
        return urlResponse
    }
}
