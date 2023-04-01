//
//  SwiftyHTTPAuthorizationHeaderValue.swift
//  
//
//  Created by Antonio Guerra on 23/03/23.
//

import Foundation

public enum SwiftyHTTPAuthorizationHeaderValue: SwiftyHTTPHeaderValue {
    case basic(String)
    case bearer(String)
    
    public var value: String {
        switch self {
            case .basic(let encodedCredentials):
                return "Basic \(!encodedCredentials.isEmpty ? encodedCredentials : "NULL")"
            case .bearer(let token):
                return "Bearer \(!token.isEmpty ? token : "NULL")"
        }
    }
}
