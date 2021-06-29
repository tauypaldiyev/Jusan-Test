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
    private let favoritesKey = "Jusan.Test.favorites"
    
    // MARK: - Methods
    public func configure(with newsTitle: String) {
        if isFavorite(with: newsTitle) {
            removeFromFavorites(with: newsTitle)
        } else {
            addToFavorites(with: newsTitle)
        }
    }
    
    public func isFavorite(with newsTitle: String) -> Bool {
        guard let favoriteTitles = UserDefaults.standard.value(forKey: favoritesKey) as? [String] else {
            return false
        }
        
        return favoriteTitles.contains(newsTitle)
    }
    
    private func removeFromFavorites(with newsTitle: String) {
        guard var favoriteTitles = UserDefaults.standard.value(forKey: favoritesKey) as? [String] else {
            return
        }
        
        favoriteTitles.removeAll(where: { $0 == newsTitle })
        UserDefaults.standard.setValue(favoriteTitles, forKey: favoritesKey)
        UserDefaults.standard.synchronize()
    }
    
    private func addToFavorites(with newsTitle: String) {
        guard var favoriteTitles = UserDefaults.standard.value(forKey: favoritesKey) as? [String] else {
            UserDefaults.standard.setValue([newsTitle], forKey: favoritesKey)
            UserDefaults.standard.synchronize()
            return
        }
        
        favoriteTitles.append(newsTitle)
        UserDefaults.standard.setValue(favoriteTitles, forKey: favoritesKey)
        UserDefaults.standard.synchronize()
    }
    
}
