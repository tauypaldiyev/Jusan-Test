//
//  NewsPagerBuilder.swift
//  Jusan Test
//
//  Created by Rauan on 28.06.2021.
//

import UIKit

final public class NewsPagerBuilder: ModuleBuilderProtocol {
    
    // MARK: Properties
    private let state: NewsPagerViewController.State
    
    // MARK: Initialization
    public init(state: NewsPagerViewController.State) {
        self.state = state
    }
    
    // MARK: - ModuleBuilder
    public func build() -> UIViewController {
        let viewController = NewsPagerViewController(state: state)
        return viewController
    }
    
}
