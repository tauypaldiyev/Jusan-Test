//
//  News+State.swift
//  Jusan Test
//
//  Created by Rauan on 28.06.2021.
//

extension NewsViewController {
    
    public enum State {
        case initial(NewsPage)
    }
    
    public func updateState() {
        switch state {
        case let .initial(page):
            self.page = page
        }
    }
    
}
