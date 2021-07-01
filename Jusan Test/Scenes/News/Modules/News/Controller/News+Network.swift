//
//  News+Network.swift
//  Jusan Test
//
//  Created by Rauan on 29.06.2021.
//

extension NewsViewController {
    
    // MARK: - Network
    public func getAllNews() {
        guard let filter = filter else { return }
        
        interactor.getAllNews(request: .init(filter: filter))
    }
    
    public func getTopNews() {
        guard let filter = filter else { return }
        
        interactor.getTopNews(request: .init(filter: filter))
    }
    
    public func getFavorites() {
        let favorites = FavoritesManager.shared.getAllFavorites()
        state = .displayAllFavorites(favorites)
    }
    
}
