//
//  NewsPage.swift
//  Jusan Test
//
//  Created by Rauan on 28.06.2021.
//

public enum NewsPage: CaseIterable {
    case all
    case top
    case favorites
    
    var title: String {
        switch self {
        case .all:
            return "Все"
        case .top:
            return "Популярные"
        case .favorites:
            return "Избранные"
        }
    }
}
