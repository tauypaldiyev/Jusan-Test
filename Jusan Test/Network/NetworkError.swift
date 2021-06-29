//
//  NetworkError.swift
//  Jusan Test
//
//  Created by Rauan on 29.06.2021.
//

import Foundation

public struct NetworkError: Error {
    
    private enum CodingKeys: String, CodingKey {
        case code
        case message
    }
    
    // MARK: - Properties
    public let code: ServerErrorCode
    public let message: String?
    
    // MARK: - Init
    public init?(json: JSON) {
        guard let code = ServerErrorCode(rawValue: json[CodingKeys.code.rawValue] as? Int ?? 9999) else {
            return nil
        }
        
        self.code = code
        self.message = json[CodingKeys.message.rawValue] as? String
    }
    
    public init(code: ServerErrorCode, message: String) {
        self.code = code
        self.message = message
    }
        
}

public extension NetworkError {
    
    // MARK: - Static Properties
    static let serverError = NetworkError(code: .unknown, message: "")
    
}
