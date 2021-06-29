//
//  DictionaryExtensions.swift
//  Jusan Test
//
//  Created by Rauan on 29.06.2021.
//

import Foundation

public extension Dictionary {
    
    static func + (lhs: [Key: Value], rhs: [Key: Value]) -> [Key: Value] {
        return lhs.merging(rhs) { $1 }
    }
    
}
