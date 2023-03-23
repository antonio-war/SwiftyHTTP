//
//  SwiftyHTTPHeader.swift
//  
//
//  Created by Antonio Guerra on 23/03/23.
//

import Foundation

enum SwiftyHTTPHeader: KeyValueRecord {
    
    case contentType(SwiftyHTTPContentType)
    
    var key: String {
        switch self {
        case .contentType:
            return "Content-Type"
        }
    }
    
    var value: String? {
        switch self {
        case .contentType(let swiftyHTTPContentType):
            return swiftyHTTPContentType.value
        }
    }
}
