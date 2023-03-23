//
//  SwiftyHTTPQueryParameter.swift
//  
//
//  Created by Antonio Guerra on 23/03/23.
//

import Foundation

struct SwiftyHTTPQueryParameter: KeyValueRecord {
    var key: String
    var value: String
    
    init(key: String, value: String) {
        self.key = key
        self.value = value
    }
    
    init(key: String, value: Any) {
        self.key = key
        self.value = "\(value)"
    }
}
