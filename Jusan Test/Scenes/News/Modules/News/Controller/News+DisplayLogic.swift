//
//  News+DisplayLogic.swift
//  Jusan Test
//
//  Created by Rauan on 29.06.2021.
//

extension NewsViewController: NewsDisplayLogic {
    
    // MARK: - NewsDisplayLogic
    public func displayAllNews(viewModel: NewsDataFlow.GetNews.ViewModel) {
        self.state = viewModel.state
    }
    
    public func displayTopNews(viewModel: NewsDataFlow.GetNews.ViewModel) {
        self.state = viewModel.state
    }
    
}
