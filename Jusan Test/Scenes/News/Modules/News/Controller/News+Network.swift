//
//  News+Network.swift
//  Jusan Test
//
//  Created by Rauan on 29.06.2021.
//

extension NewsViewController {
    
    // MARK: - Network
    public func getAllNews() {
        interactor.getAllNews(request: .init(filter: Filter()))
    }
    
    public func getTopNews() {
        interactor.getTopNews(request: .init(filter: Filter()))
    }
    
}
