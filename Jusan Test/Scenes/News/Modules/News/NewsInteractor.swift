//
//  NewsInteractor.swift
//  Jusan Test
//
//  Created by Rauan on 28.06.2021.
//

public protocol NewsBusinessLogic {
    func getAllNews(request: NewsDataFlow.GetNews.Request)
    func getTopNews(request: NewsDataFlow.GetNews.Request)
}

public final class NewsInteractor: NewsBusinessLogic {
    
    // MARK: - Properties
    private let presenter: NewsPresentationLogic
    private let provider: NewsProviderProtocol
    
    // MARK: - Initialization
    public init(presenter: NewsPresentationLogic,
                provider: NewsProviderProtocol = NewsProvider()) {
        self.presenter = presenter
        self.provider = provider
    }
    
    // MARK: - NewsBusinessLogic
    public func getAllNews(request: NewsDataFlow.GetNews.Request) {
        provider.getAllNews(request: request) { [weak self] in
            switch $0 {
            case let .successfull(model):
                self?.presenter.getAllNews(response: .init(result: .successfull(model: model)))
            case let .failed(error):
                self?.presenter.getAllNews(response: .init(result: .failed(error: error)))
            }
        }
    }
    
    public func getTopNews(request: NewsDataFlow.GetNews.Request) {
        provider.getTopNews(request: request) { [weak self] in
            switch $0 {
            case let .successfull(count):
                self?.presenter.getTopNews(response: .init(result: .successfull(model: count)))
            case let .failed(error):
                self?.presenter.getTopNews(response: .init(result: .failed(error: error)))
            }
        }
    }
    
}
