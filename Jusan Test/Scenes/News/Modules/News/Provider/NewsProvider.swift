//
//  NewsProvider.swift
//  Jusan Test
//
//  Created by Rauan on 28.06.2021.
//

public protocol NewsProviderProtocol {
    func getAllNews(request: NewsDataFlow.GetNews.Request,
                    completion: @escaping (NewsDataFlow.GetNewsResult) -> Void)
    func getTopNews(request: NewsDataFlow.GetNews.Request,
                    completion: @escaping (NewsDataFlow.GetNewsResult) -> Void)
}

public final class NewsProvider: NewsProviderProtocol {
    
    // MARK: - Properties
    private let service: NewsServiceProtocol
    
    // MARK: - Init
    public init(service: NewsServiceProtocol =
                    NewsService(provider: NetworkProvider<NewsEndpoint>())) {
        self.service = service
    }
    
    // MARK: - NewsProviderProtocol
    public func getAllNews(request: NewsDataFlow.GetNews.Request,
                           completion: @escaping (NewsDataFlow.GetNewsResult) -> Void) {
        service.getAllNews(request: request) {
            switch $0 {
            case let .success(json):
                if let articlesJSON = json["articles"] as? [JSON] {
                    completion(.successfull(model: articlesJSON.compactMap { NewsDTO(json: $0) }))
                } else {
                    completion(.failed(error: .serverError))
                }
            case let .failure(error):
                completion(.failed(error: error))
            }
        }
    }
    
    public func getTopNews(request: NewsDataFlow.GetNews.Request,
                         completion: @escaping (NewsDataFlow.GetNewsResult) -> Void) {
        service.getTopNews(request: request) {
            switch $0 {
            case let .success(json):
                if let articlesJSON = json["articles"] as? [JSON] {
                    completion(.successfull(model: articlesJSON.compactMap { NewsDTO(json: $0) }))
                } else {
                    completion(.failed(error: .serverError))
                }
            case let .failure(error):
                completion(.failed(error: error))
            }
        }
    }
    
}
