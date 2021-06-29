//
//  InfiniteScrollableTableView.swift
//  Jusan Test
//
//  Created by Rauan on 29.06.2021.
//

import UIKit

public protocol InfiniteScrollableTableViewDelegate: AnyObject {
    func tableView(_ tableView: UITableView, scrollViewDidScroll scrollView: UIScrollView)
}

open class InfiniteScrollableTableView: UITableView {
    
    // MARK: - Properties
    private var isInfiniteScrollEnabled = true
    public weak var infiniteScrollDelegate: InfiniteScrollableTableViewDelegate? {
        didSet {
            isInfiniteScrollEnabled = true
        }
    }
    
    // MARK: - Views
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.color = .darkGray
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()
    
    // MARK: - Init
    public override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        configure()
    }
    
    public required init?(coder: NSCoder) {
        return nil
    }
    
    // MARK: - Methods
    public func startInfiniteScroll() {
        isInfiniteScrollEnabled = false
        tableFooterView?.isHidden = false
        activityIndicator.startAnimating()
    }
    
    public func finishInfiniteScroll() {
        isInfiniteScrollEnabled = true
        tableFooterView?.isHidden = true
        activityIndicator.stopAnimating()
    }
    
    public func removeInfiniteScroll() {
        isInfiniteScrollEnabled = false
    }
    
    public func infiniteScrollViewDidScroll(_ scrollView: UIScrollView) {
        guard isInfiniteScrollEnabled else { return }
        
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - (scrollView.frame.size.height * 2)
         
        if maximumOffset - currentOffset <= 0 {
            infiniteScrollDelegate?.tableView(self, scrollViewDidScroll: scrollView)
        }
    }
    
    private func configure() {
        tableFooterView = activityIndicator
    }
    
}
