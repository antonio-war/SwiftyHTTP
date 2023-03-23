//
//  SwiftyHTTPHeader.swift
//  
//
//  Created by Antonio Guerra on 23/03/23.
//

import Foundation

enum SwiftyHTTPHeader: KeyValueRecord {
    
    case contentType(SwiftyHTTPContentType)
    case accept(SwiftyHTTPAccept)
    case authorization(SwiftyHTTPAuthorization)
    
    var key: String {
        switch self {
        case .contentType:
            return "Content-Type"
        case .accept:
            return "Accept"
        case .authorization:
            return "Authorization"
        }
    }
    
    var value: String? {
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
