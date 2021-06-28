//
//  CollectionView+Dequeue.swift
//  Jusan Test
//
//  Created by Rauan on 28.06.2021.
//

import UIKit

public extension UICollectionView {
    
    func dequeueReusableCell<Cell: UICollectionViewCell>(for indexPath: IndexPath) -> Cell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: "\(Cell.self)", for: indexPath) as? Cell else {
            fatalError("register(cellClass:) has not been implemented")
        }
        
        return cell
    }
    
}
