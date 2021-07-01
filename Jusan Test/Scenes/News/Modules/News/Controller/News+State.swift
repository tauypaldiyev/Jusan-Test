//
//  News+State.swift
//  Jusan Test
//
//  Created by Rauan on 28.06.2021.
//

extension NewsViewController {
    
    public enum State {
        case initial(NewsPage)
        case displayAllNews([NewsDTO])
        case displayTopNews([NewsDTO])
        case displayAllFavorites([NewsDTO])
        case allNewsError(Error)
        case topNewsError(Error)
    }
    
    public func updateState() {
        endRefreshingIfNeeded()
        mainView.finishInfiniteScroll()
        switch state {
        case let .initial(page):
            self.page = page
        case let .displayAllNews(news),
             let .displayTopNews(news),
             let .displayAllFavorites(news):
            updateList(news)
            removeInfiniteScrollIfNeeded(news)
        case let .allNewsError(error),
             let .topNewsError(error):
            print(error)
            mainView.removeInfiniteScroll()
        }
    }
    
    private func updateList(_ news: [NewsDTO]) {
        if filter?.page == 1 {
            self.news = news
        } else {
            self.news.append(contentsOf: news)
        }
    }
    
    private func endRefreshingIfNeeded() {
        guard refreshControl.isRefreshing else { return }
        
        refreshControl.endRefreshing()
    }
    
    private func removeInfiniteScrollIfNeeded(_ news: [NewsDTO]) {
        guard news.count < filter?.pageSize ?? 0 else { return }
            
        mainView.removeInfiniteScroll()
    }
    
}
