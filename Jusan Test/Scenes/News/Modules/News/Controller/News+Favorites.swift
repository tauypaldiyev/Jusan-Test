//
//  News+Favorites.swift
//  Jusan Test
//
//  Created by Rauan on 29.06.2021.
//

import UIKit

extension NewsViewController: NewsCellDelegate {
    
    // MARK: - NewsCellDelegate
    public func cell(_ cell: NewsCell, didTappedFavoriteButton button: UIButton) {
        guard let index = mainView.indexPath(for: cell),
              let news = news[safe: index.row] else { return }
        
        FavoritesManager.shared.configure(with: news)
        cell.configure(with: NewsCellViewModel(news: news))
    }
    
}
