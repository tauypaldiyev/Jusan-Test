//
//  NewsPresenter.swift
//  Jusan Test
//
//  Created by Rauan on 28.06.2021.
//

public protocol NewsPresentationLogic: AnyObject {
    func getAllNews(response: NewsDataFlow.GetNews.Response)
    func getTopNews(response: NewsDataFlow.GetNews.Response)
}

public final class NewsPresenter: NewsPresentationLogic {
    
    // MARK: - Properties
    public weak var viewController: NewsDisplayLogic?
    
    // MARK: - NewsPresentationLogic
    public func getAllNews(response: NewsDataFlow.GetNews.Response) {
        var viewModel: NewsDataFlow.GetNews.ViewModel
        defer { viewController?.displayAllNews(viewModel: viewModel) }
        
        switch response.result {
        case let .successfull(model):
            viewModel = .init(state: .displayAllNews(model))
        case let .failed(error):
            viewModel = .init(state: .allNewsError(error))
        }
    }
    
    public func getTopNews(response: NewsDataFlow.GetNews.Response) {
        var viewModel: NewsDataFlow.GetNews.ViewModel
        defer { viewController?.displayTopNews(viewModel: viewModel) }
        
        switch response.result {
        case let .successfull(model):
            viewModel = .init(state: .displayTopNews(model))
        case let .failed(error):
            viewModel = .init(state: .topNewsError(error))
        }
    }
    
}
