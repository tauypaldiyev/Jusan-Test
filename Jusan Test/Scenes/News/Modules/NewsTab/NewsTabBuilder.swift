//
//  NewsBuilder.swift
//  Jusan Test
//
//  Created by Rauan on 28.06.2021.
//

import UIKit

final public class NewsTabBuilder: ModuleBuilderProtocol {
    
    // MARK: Properties
    private let state: NewsTabViewController.State
    
    // MARK: Initialization
    public init(state: NewsTabViewController.State) {
        self.state = state
    }
    
    // MARK: - ModuleBuilder
    public func build() -> UIViewController {
        let viewController = NewsTabViewController(state: state)
        return viewController
    }
    
}
