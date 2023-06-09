//
//  SwiftyHTTPQueryParameter.swift
//  
//
//  Created by Antonio Guerra on 23/03/23.
//

import Foundation

public struct SwiftyHTTPQueryParameter: KeyValueRepresentable {
    public var key: String
    public var value: String
    
    public init(key: String, value: String) {
        self.key = key
        self.value = value
    }
    
    public init(key: String, value: Any) {
        self.key = key
        self.value = "\(value)"
    }
}
