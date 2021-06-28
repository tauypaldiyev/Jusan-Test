//
//  NewsTabView.swift
//  Jusan Test
//
//  Created by Rauan on 28.06.2021.
//

import UIKit

public final class NewsTabView: UICollectionView {
    
    // MARK: - Init
    public init() {
        let layout: UICollectionViewFlowLayout = {
            let layout = UICollectionViewFlowLayout()
            layout.minimumInteritemSpacing = 10
            layout.minimumLineSpacing = 10
            layout.scrollDirection = .horizontal
            return layout
        }()
        
        super.init(frame: .zero, collectionViewLayout: layout)

        configure()
    }
    
    public required init?(coder: NSCoder) {
        return nil
    }
    
    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        configureColors()
    }
    
    // MARK: - Methods
    private func configure() {
        allowsMultipleSelection = false
        contentInset = .init(top: 0, left: 10, bottom: 0, right: 10)
        
        [
            NewsTabCell.self
        ].forEach {
            register(cellClass: $0)
        }
        configureColors()
    }
    
    private func configureColors() {
        backgroundColor = .clear
        showsHorizontalScrollIndicator = false
    }
    
}
