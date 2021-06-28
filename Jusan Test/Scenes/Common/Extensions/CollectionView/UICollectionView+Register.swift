//
//  UICollectionView+Register.swift
//  Jusan Test
//
//  Created by Rauan on 28.06.2021.
//

import UIKit

public extension UICollectionView {
    
    func register(cellClass: AnyClass) {
        register(cellClass, forCellWithReuseIdentifier: "\(cellClass)")
    }
    
}
