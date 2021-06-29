//
//  News+TableView.swift
//  Jusan Test
//
//  Created by Rauan on 29.06.2021.
//

import UIKit

extension NewsViewController: UITableViewDataSource {
    
    // MARK: - UITableViewDataSource
    public func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].rows.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row: NewsViewController.Section.Row = sections[indexPath.section].rows[indexPath.row]
        switch row {
        case .news:
            let cell: NewsCell = tableView.dequeueReusableCell(for: indexPath)
            let news = news[indexPath.row]
            cell.configure(with: NewsCellViewModel(news: news))
            return cell
        }
    }
    
}

extension NewsViewController: UITableViewDelegate {
    
    // MARK: - UITableViewDelegate
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row: NewsViewController.Section.Row = sections[indexPath.section].rows[indexPath.row]
        switch row {
        case .news:
            let news = news[indexPath.row]
            print(news.title ?? "")
        }
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        let row: NewsViewController.Section.Row = sections[indexPath.section].rows[indexPath.row]
        switch row {
        case .news:
            return 200
        }
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row: NewsViewController.Section.Row = sections[indexPath.section].rows[indexPath.row]
        switch row {
        case .news:
            return UITableView.automaticDimension
        }
    }
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let row: NewsViewController.Section.Row = sections[indexPath.section].rows[indexPath.row]
        switch row {
        case .news:
            guard let cell = cell as? NewsCell else { return }

            let news = news[indexPath.row]
            cell.delegate = self
            cell.configure(with: NewsCellViewModel(news: news))
        }
    }
    
}
