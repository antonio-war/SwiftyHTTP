//
//  KeyValueRecord.swift
//  
//
//  Created by Antonio Guerra on 23/03/23.
//

import Foundation

public protocol KeyRepresentable{
    associatedtype KeyType: Hashable
    
    var key: KeyType { get }
}

public protocol ValueRepresentable {
    associatedtype ValueType: Codable
    
    var value: ValueType { get }
}

public protocol KeyValueRepresentable: KeyRepresentable, ValueRepresentable {}
