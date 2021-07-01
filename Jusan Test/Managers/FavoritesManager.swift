//
//  FavoritesManager.swift
//  Jusan Test
//
//  Created by Rauan on 29.06.2021.
//

import UIKit

public final class FavoritesManager {
    
    // MARK: - Properties
    public static let shared = FavoritesManager()
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let favoritesKey = "Jusan.Test.favorites"
    
    // MARK: - Methods
    public func configure(with news: NewsDTO) {
        if isFavorite(with: news) {
            removeFromFavorites(with: news)
        } else {
            addToFavorites(with: news)
        }
    }
    
    public func isFavorite(with news: NewsDTO) -> Bool {
        guard var _ = getAllFavorites().firstIndex(where: { $0.title == news.title }) else {
            return false
        }
        
        return true
    }
    
    public func getAllFavorites() -> [NewsDTO] {
        guard let favoritesData = UserDefaults.standard.value(forKey: favoritesKey) as? Data,
              let favorites = try? decoder.decode([NewsDTO].self, from: favoritesData) else {
            return []
        }
        
        return favorites
    }
    
    private func removeFromFavorites(with news: NewsDTO) {
        var favorites = getAllFavorites()
        favorites.removeAll(where: { $0.title == news.title })
        guard let data = try? encoder.encode(favorites.self) else { return }
        
        UserDefaults.standard.setValue(data, forKey: favoritesKey)
        UserDefaults.standard.synchronize()
    }
    
    private func addToFavorites(with news: NewsDTO) {
        guard let data = try? encoder.encode([news].self) else { return }
        
        var favorites = getAllFavorites()
        guard !favorites.isEmpty else {
            UserDefaults.standard.setValue(data, forKey: favoritesKey)
            UserDefaults.standard.synchronize()
            return
        }
        
        favorites.append(news)
        guard let data = try? encoder.encode(favorites.self) else { return }
        
        UserDefaults.standard.setValue(data, forKey: favoritesKey)
        UserDefaults.standard.synchronize()
    }
    
}
