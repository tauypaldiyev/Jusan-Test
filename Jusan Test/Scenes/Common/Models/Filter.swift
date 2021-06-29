//
//  FilterParameters.swift
//  Jusan Test
//
//  Created by Rauan on 28.06.2021.
//

import Foundation

public struct Filter: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case q, page, pageSize
    }
    
    // MARK: - Properties
    private var q = "America"
    private var page = 1
    private var pageSize = 15
    
    // MARK: - Init
    public func toJSON() -> JSON {
        guard let data = try? JSONEncoder().encode(self),
              let json = try? JSONSerialization.jsonObject(with: data, options: []) as? JSON else { return [:] }
        
        return json
    }
    
}
