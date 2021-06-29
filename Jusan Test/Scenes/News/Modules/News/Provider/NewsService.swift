//
//  NewsService.swift
//  Jusan Test
//
//  Created by Rauan on 28.06.2021.
//

public protocol NewsServiceProtocol {
    func getAllNews(request: NewsDataFlow.GetNews.Request,
                    completion: @escaping (NetworkResult) -> Void)
    func getTopNews(request: NewsDataFlow.GetNews.Request,
                  completion: @escaping (NetworkResult) -> Void)
}

public final class NewsService: NewsServiceProtocol {
    
    // MARK: - Properties
    private let provider: NetworkProvider<NewsEndpoint>
    
    // MARK: - Init
    public init(provider: NetworkProvider<NewsEndpoint>) {
        self.provider = provider
    }
    
    // MARK: - NewsServiceProtocol
    public func getAllNews(request: NewsDataFlow.GetNews.Request,
                           completion: @escaping (NetworkResult) -> Void) {
        provider.send(target: .getAllNews(request.filter)) { result in
            completion(result)
        }
    }
    
    public func getTopNews(request: NewsDataFlow.GetNews.Request,
                         completion: @escaping (NetworkResult) -> Void) {
        provider.send(target: .getTopNews(request.filter)) { result in
            completion(result)
        }
    }
    
}
