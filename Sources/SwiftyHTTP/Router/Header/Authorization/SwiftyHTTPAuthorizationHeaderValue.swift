//
//  SwiftyHTTPAuthorizationHeaderValue.swift
//  
//
//  Created by Antonio Guerra on 23/03/23.
//

import Foundation

enum SwiftyHTTPAuthorizationHeaderValue: SwiftyHTTPHeaderValue {
    case basic(String)
    case bearer(String)
    
    var value: String {
        switch self {
            case .basic(let encodedCredentials):
                return "Basic \(encodedCredentials)"
            case .bearer(let token):
                return "Bearer \(token)"
        }
    }
}
