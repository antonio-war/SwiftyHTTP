//
//  URLResponseRepresentable.swift
//  
//
//  Created by Antonio Guerra on 25/03/23.
//

import Foundation

public protocol URLResponseRepresentable {
    var url: URL? { get }
    var statusCode: Int { get }
    var headers: [AnyHashable: Any] { get }
    func callAsFunction() throws -> HTTPURLResponse
}
