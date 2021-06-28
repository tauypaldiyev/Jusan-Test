//
//  CollectionExtensions.swift
//  Jusan Test
//
//  Created by Rauan on 28.06.2021.
//

import Foundation

public extension Collection {

    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
}
