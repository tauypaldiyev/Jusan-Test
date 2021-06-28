//
//  NewsTab+CollectionView.swift
//  Jusan Test
//
//  Created by Rauan on 28.06.2021.
//

import UIKit

extension NewsTabViewController: UICollectionViewDataSource {
     
    // MARK: - UICollectionViewDataSource
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].rows.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let row = sections[indexPath.section].rows[indexPath.row]
        switch row {
        case .page:
            let cell: NewsTabCell = collectionView.dequeueReusableCell(for: indexPath)
            return cell
        }
    }
    
}

extension NewsTabViewController: UICollectionViewDelegateFlowLayout {

    // MARK: - UICollectionViewDelegateFlowLayout
    public func collectionView(_ collectionView: UICollectionView,
                               didSelectItemAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
        collectionView.selectItem(at: selectedIndexPath, animated: true, scrollPosition: .centeredHorizontally)
        pagerViewController.setFirst(index: indexPath.row)
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath: IndexPath) -> CGSize {
        let row = sections[indexPath.section].rows[indexPath.row]
        switch row {
        case .page:
            let width = NewTabsCellViewModel(row: row).title?.size().width ?? .zero
            return CGSize(width: width + 20, height: collectionView.bounds.height)
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let row = sections[indexPath.section].rows[indexPath.row]
        switch row {
        case .page:
            guard let cell = cell as? NewsTabCell else { return }
            
            cell.configure(with: NewTabsCellViewModel(row: row))
            if indexPath == selectedIndexPath {
                cell.isSelected = true
                collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .top)
            } else {
                cell.isSelected = false
            }
        }
    }
        
}
