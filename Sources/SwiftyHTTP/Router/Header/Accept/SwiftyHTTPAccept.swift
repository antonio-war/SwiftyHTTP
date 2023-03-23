//
//  SwiftyHTTPAccept.swift
//  
//
//  Created by Antonio Guerra on 23/03/23.
//

import Foundation

enum SwiftyHTTPAccept: SwiftyHTTPHeaderValue {
    case anything
    
    var value: String {
        switch self {
        case .anything:
            return "*/*"
        }
    }
}
