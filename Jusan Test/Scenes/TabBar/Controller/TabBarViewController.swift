//
//  TabBarViewController.swift
//  Jusan Test
//
//  Created by Rauan on 28.06.2021.
//

import UIKit

public final class TabBarViewController: UITabBarController {
    
    // MARK: - Properties
    public var state: State {
        didSet {
            updateState()
        }
    }
    private lazy var newsController = UIViewController()
    private lazy var favoriteNewsController = UIViewController()
    
    // MARK: - Init
    init(state: State) {
        self.state = state
        
        super.init(nibName: nil, bundle: nil)
        
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    // MARK: - Methods
    public func configureTabBar() {
        viewControllers = [
            newsController,
            favoriteNewsController
        ]
    }
    
    private func configureViews() {
        
    }
    
}
