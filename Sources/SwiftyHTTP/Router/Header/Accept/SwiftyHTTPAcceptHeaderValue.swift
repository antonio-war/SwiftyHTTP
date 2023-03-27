//
//  SwiftyHTTPAcceptHeaderValue.swift
//  
//
//  Created by Antonio Guerra on 23/03/23.
//

import Foundation

public enum SwiftyHTTPAcceptHeaderValue: SwiftyHTTPHeaderValue {
    case anything
    
    public var value: String {
        switch self {
        case .anything:
            return "*/*"
        }
    }
}
