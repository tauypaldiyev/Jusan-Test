//
//  NewsPagerViewController.swift
//  Jusan Test
//
//  Created by Rauan on 28.06.2021.
//

import UIKit

public protocol NewsPagerViewControllerDelegate: AnyObject {
    func controller(_ controller: NewsPagerViewController, didSelectIndex index: Int)
}

public final class NewsPagerViewController: UIPageViewController {
    
    // MARK: - Properties
    public weak var pagerDelegate: NewsPagerViewControllerDelegate?
    public var pages: [NewsPage] = [] {
        didSet {
            allViewControllers = pages.compactMap {
                NewsBuilder(state: .initial($0)).build()
            }
        }
    }
    public var state: State {
        didSet {
            updateState()
        }
    }
    public var allViewControllers = [UIViewController]() {
        didSet {
            setInitialViewController()
        }
    }
    public var selectedIndex = Int.zero
    
    // MARK: - Init
    public init(state: State) {
        self.state = state
        
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }

    public required init?(coder: NSCoder) {
        return nil
    }
    
    // MARK: - Life Cycle
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        state = { state }()
    }
    
    // MARK: - Methods
    public func setFirst(index: Int) {
        guard let viewController = allViewControllers[safe: index] else {
            return
        }
        
        setViewControllers([viewController],
                           direction: index < selectedIndex ? .reverse : .forward,
                           animated: true) { [weak self] _ in
            self?.dataSource = self
            self?.delegate = self
            self?.selectedIndex = index
        }
    }
    
    public func setInitialViewController() {
        guard let viewController = allViewControllers[safe: selectedIndex] else {
            return
        }
        
        setViewControllers([viewController],
                           direction: .forward,
                           animated: false) { [weak self] _ in
            self?.dataSource = self
            self?.delegate = self
        }
    }
    
    deinit {
        NSLog("deinit \(self)")
    }

}
