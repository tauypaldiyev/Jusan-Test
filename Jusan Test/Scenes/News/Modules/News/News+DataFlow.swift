//
//  News+DataFlow.swift
//  Jusan Test
//
//  Created by Rauan on 28.06.2021.
//

public enum NewsDataFlow {
    
}

extension NewsDataFlow {
    
    // MARK: - Get News
    public enum GetNews {
        public struct Request {
            var filter: Filter
        }
        public struct Response {
            let result: GetNewsResult
        }
        public struct ViewModel {
            var state: NewsViewController.State
        }
    }
    
    public enum GetNewsResult {
        case successfull(model: [NewsDTO])
        case failed(error: NetworkError)
    }
    
}
