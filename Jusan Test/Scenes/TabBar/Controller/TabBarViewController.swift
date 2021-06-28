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
    private lazy var newsController: UIViewController = {
        let controller = UIViewController()
        controller.tabBarItem = UITabBarItem(tabBarSystemItem: .mostViewed, tag: 0)
        return controller
    }()
    private lazy var favoriteNewsController: UIViewController = {
        let controller = UIViewController()
        controller.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        return controller
    }()
    
    // MARK: - Init
    init(state: State) {
        self.state = state
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    // MARK: - Lifecycle
    public override func loadView() {
        super.loadView()
        
        configureViews()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        state = { state }()
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
