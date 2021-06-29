//
//  NewsView.swift
//  Jusan Test
//
//  Created by Rauan on 29.06.2021.
//

import UIKit

public final class NewsView: InfiniteScrollableTableView {
    
    // MARK: - Init
    public init() {
        super.init(frame: .zero, style: .plain)
        
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    // MARK: - Methods
    private func configureViews() {
        backgroundColor = .clear
        separatorStyle = .none
        
        [
            NewsCell.self
        ].forEach {
            register(cellClass: $0)
        }
    }
    
}
