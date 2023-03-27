//
//  SwiftyHTTPResponse.swift
//  
//
//  Created by Antonio Guerra on 25/03/23.
//

import Foundation

public struct SwiftyHTTPResponse<Body: SwiftyHTTPBody>: URLResponseRepresentable {
    
    private var urlResponse: HTTPURLResponse
    public var body: Body
    
    public var url: URL? {
        urlResponse.url
    }
    
    public var statusCode: Int {
        urlResponse.statusCode
    }
    
    public var headers: [SwiftyHTTPHeader] {
        // TODO: Add headers decoding
        []
    }

    init(urlResponse: HTTPURLResponse, body: Body) {
        self.urlResponse = urlResponse
        self.body = body
    }

    public func callAsFunction() throws -> HTTPURLResponse {
        return urlResponse
    }
}