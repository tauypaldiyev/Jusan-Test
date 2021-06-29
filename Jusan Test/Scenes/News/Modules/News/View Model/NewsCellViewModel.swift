//
//  NewsCellViewModel.swift
//  Jusan Test
//
//  Created by Rauan on 29.06.2021.
//

import UIKit

public protocol NewsCellProtocol {
    var title: NSAttributedString? { get }
    var author: NSAttributedString? { get }
    var description: NSAttributedString? { get }
    var imageURL: URL? { get }
}

public struct NewsCellViewModel: NewsCellProtocol {
    
    // MARK: - Properties
    private let news: NewsDTO
    
    // MARK: - NewsCellProtocol
    public var title: NSAttributedString? {
        return NSAttributedString(string: news.title ?? "", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .medium)
        ])
    }
    
    public var author: NSAttributedString? {
        return NSAttributedString(string: news.author ?? "", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .light)
        ])
    }
    
    public var description: NSAttributedString? {
        return NSAttributedString(string: news.description ?? "", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .regular)
        ])
    }
    
    public var imageURL: URL? {
        return news.url
    }
    
    // MARK: - Init
    public init(news: NewsDTO) {
        self.news = news
    }
    
}
