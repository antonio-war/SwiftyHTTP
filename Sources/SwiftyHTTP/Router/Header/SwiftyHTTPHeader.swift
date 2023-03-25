//
//  SwiftyHTTPHeader.swift
//  
//
//  Created by Antonio Guerra on 23/03/23.
//

import Foundation

public enum SwiftyHTTPHeader: KeyValueRepresentable {
    
    case contentType(SwiftyHTTPContentTypeHeaderValue)
    case accept(SwiftyHTTPAcceptHeaderValue)
    case authorization(SwiftyHTTPAuthorizationHeaderValue)
    
    public var key: String {
        switch self {
        case .contentType:
            return "Content-Type"
        case .accept:
            return "Accept"
        case .authorization:
            return "Authorization"
        }
    }
    
    public var value: String? {
        switch self {
        case .contentType(let swiftyHTTPContentType):
            return swiftyHTTPContentType.value
        case .accept(let swiftyHTTPAccept):
            return swiftyHTTPAccept.value
        case .authorization(let swiftyHTTPAuthorization):
            return swiftyHTTPAuthorization.value
        }
    }
}
