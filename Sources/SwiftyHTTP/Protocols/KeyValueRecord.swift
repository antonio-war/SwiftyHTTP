//
//  KeyValueRecord.swift
//  
//
//  Created by Antonio Guerra on 23/03/23.
//

import Foundation

protocol KeyStoreable {
    associatedtype KeyType: Hashable
    
    var key: KeyType { get }
}

protocol ValueRepresentable {
    associatedtype ValueType: Codable
    
    var value: ValueType { get }
}

protocol KeyValueRecord: KeyStoreable, ValueRepresentable {}
