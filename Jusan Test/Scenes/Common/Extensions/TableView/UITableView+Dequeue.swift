//
//  UITableView+Dequeue.swift
//  Jusan Test
//
//  Created by Rauan on 28.06.2021.
//

import UIKit

public extension UITableView {
    
    func dequeueReusableCell<Cell: UITableViewCell>(for indexPath: IndexPath) -> Cell {
        guard let cell = dequeueReusableCell(withIdentifier: "\(Cell.self)", for: indexPath) as? Cell else {
            fatalError("register(cellClass:) has not been implemented")
        }
        
        return cell
    }
    
}
