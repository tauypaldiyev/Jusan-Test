//
//  NewsTab+Pager.swift
//  Jusan Test
//
//  Created by Rauan on 28.06.2021.
//

import UIKit

extension NewsTabViewController: NewsPagerViewControllerDelegate {
    
    // MARK: - NewsPagerViewControllerDelegate
    public func controller(_ controller: NewsPagerViewController, didSelectIndex index: Int) {
        guard let section = sections.firstIndex(where: { $0.section == .section }),
              sections[section].rows[safe: index] != nil else {
            return
        }
        
        selectedIndexPath = IndexPath(row: index, section: section)
        mainView.selectItem(at: IndexPath(row: index, section: section), animated: true, scrollPosition: .centeredHorizontally)
    }
    
}
