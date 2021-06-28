//
//  NewTabsCellViewModel.swift
//  Jusan Test
//
//  Created by Rauan on 28.06.2021.
//

import UIKit

public protocol NewsTabCellProtocol {
    var title: NSAttributedString? { get }
}

public struct NewTabsCellViewModel: NewsTabCellProtocol {
    
    public typealias Row = NewsTabViewController.Section.Row
    
    // MARK: - Properties
    private let row: Row
    
    // MARK: - NewsCellProtocol
    public var title: NSAttributedString? {
        switch row {
        case let .page(page):
            return NSAttributedString(string: page.title, attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24, weight: .medium),
                NSAttributedString.Key.foregroundColor: UIColor.black
            ])
        }
    }
    
    // MARK: - Init
    public init(row: Row) {
        self.row = row
    }
    
}
