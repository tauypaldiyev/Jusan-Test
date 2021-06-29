//
//  Configurations.swift
//  Jusan Test
//
//  Created by Rauan on 28.06.2021.
//

import Foundation

public final class Configurations {
    
    // MARK: - Methods
    public static func getBaseURL() -> URL {
        guard let http = getValue(for: ConfigurationKeys.http),
              let urlString = getValue(for: ConfigurationKeys.baseURL),
              let version2 = getValue(for: ConfigurationKeys.version2),
              let url = URL(string: "\(http)\(urlString)\(version2)") else {
            fatalError("Cannot get base url")
        }
        
        return url
    }
    
    public static func apiKey() -> String {
        guard let string = getValue(for: ConfigurationKeys.apiKey) else {
            fatalError("Cannot get string")
        }
        
        return string
    }
    
    private static func getValue(for key: String) -> String? {
        return Bundle.main.object(forInfoDictionaryKey: key) as? String
    }
    
}
