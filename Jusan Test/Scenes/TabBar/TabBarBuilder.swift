//
//  TabBarBuilder.swift
//  Jusan Test
//
//  Created by Rauan on 28.06.2021.
//

import UIKit

final public class TabBarBuilder: ModuleBuilderProtocol {
    
    // MARK: Properties
    private let state: TabBarViewController.State
    
    // MARK: Initialization
    public init(state: TabBarViewController.State) {
        self.state = state
    }
    
    // MARK: - ModuleBuilder
    public func build() -> UIViewController {
        let viewController = TabBarViewController(state: state)
        return viewController
    }
    
}
