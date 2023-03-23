//
//  SwiftyHTTPAuthorization.swift
//  
//
//  Created by Antonio Guerra on 23/03/23.
//

import Foundation

enum SwiftyHTTPAuthorization: SwiftyHTTPHeaderValue {
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
