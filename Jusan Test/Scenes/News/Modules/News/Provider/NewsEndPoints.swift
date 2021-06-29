//
//  NewsEndPoints.swift
//  Jusan Test
//
//  Created by Rauan on 28.06.2021.
//

import Moya

public enum NewsEndpoint {
    case getAllNews(Filter)
    case getTopNews(Filter)
}

extension NewsEndpoint: TargetType {
    
    public var baseURL: URL {
        switch self {
        case .getAllNews, .getTopNews:
            return Configurations.getBaseURL()
        }
    }
    
    public var path: String {
        switch self {
        case .getTopNews:
            return "top-headlines/"
        case .getAllNews:
            return "everything/"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getTopNews, .getAllNews:
            return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Moya.Task {
        switch self {
        case let .getTopNews(filter),
             let .getAllNews(filter):
            let defaultEncoding = URLEncoding.default
            let encoding = URLEncoding(destination: defaultEncoding.destination,
                                         arrayEncoding: defaultEncoding.arrayEncoding,
                                         boolEncoding: .literal)
            return .requestParameters(parameters: filter.toJSON() + ["apiKey": Configurations.apiKey()], encoding: encoding)
        }
    }
    
    public var headers: [String: String]? {
        return [
            "Accept-Language": "ru",
            "Content-Type": "application/json"
        ]
    }
    
}
