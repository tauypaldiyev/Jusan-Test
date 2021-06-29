//
//  SourceDTO.swift
//  Jusan Test
//
//  Created by Rauan on 28.06.2021.
//

public struct SourceDTO: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
    }
    
    // MARK: - Properties
    public let id: Int
    public let name: String?
    
    // MARK: - Init
    public init?(json: JSON) {
        guard let id = json[CodingKeys.id.rawValue] as? Int else {
            return nil
        }
        
        self.id = id
        self.name = json[CodingKeys.name.rawValue] as? String
    }
    
}
