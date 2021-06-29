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
        case allNewsError(Error)
        case topNewsError(Error)
    }
    
    public func updateState() {
        switch state {
        case let .initial(page):
            self.page = page
        case let .displayAllNews(news),
             let .displayTopNews(news):
            self.news = news
        case let .allNewsError(error),
             let .topNewsError(error):
            print(error)
        }
    }
    
}
