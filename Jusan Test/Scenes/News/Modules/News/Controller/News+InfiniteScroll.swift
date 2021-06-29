//
//  News+InfiniteScroll.swift
//  Jusan Test
//
//  Created by Rauan on 29.06.2021.
//

import UIKit

extension NewsViewController: InfiniteScrollableTableViewDelegate {
    
    // MARK: - InfiniteScrollTableViewDelegate
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        mainView.infiniteScrollViewDidScroll(scrollView)
    }
    
    public func tableView(_ tableView: UITableView, scrollViewDidScroll scrollView: UIScrollView) {
        self.filter?.page += 1
        mainView.startInfiniteScroll()
    }
    
}
