//
//  URLRequestRepresentable.swift
//  
//
//  Created by Antonio Guerra on 25/03/23.
//

import Foundation

public protocol URLRequestRepresentable {
    var request: URLRequest { get throws }
}

public extension URLRequestRepresentable {
    func callAsFunction() throws -> URLRequest {
        return try request
    }
}
