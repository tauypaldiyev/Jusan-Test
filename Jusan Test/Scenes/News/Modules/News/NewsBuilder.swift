//
//  NewsBuilder.swift
//  Jusan Test
//
//  Created by Rauan on 28.06.2021.
//

import UIKit

final public class NewsBuilder: ModuleBuilderProtocol {
    
    // MARK: Properties
    private let state: NewsViewController.State
    
    // MARK: Initialization
    public init(state: NewsViewController.State) {
        self.state = state
    }
    
    // MARK: - ModuleBuilder
    public func build() -> UIViewController {
        let viewController = NewsViewController(state: state)
        return viewController
    }
    
}
