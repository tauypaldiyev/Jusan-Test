//
//  NewsViewController.swift
//  Jusan Test
//
//  Created by Rauan on 28.06.2021.
//

import UIKit

public protocol NewsDisplayLogic: AnyObject {
    func displayAllNews(viewModel: NewsDataFlow.GetNews.ViewModel)
    func displayTopNews(viewModel: NewsDataFlow.GetNews.ViewModel)
}

public final class NewsViewController: UIViewController {
    
    // MARK: - Properties
    public let interactor: NewsBusinessLogic
    public var page: NewsPage = .all {
        didSet {
            switch page {
            case .all:
                getAllNews()
            case .top:
                getTopNews()
            }
        }
    }
    public var state: State {
        didSet {
            updateState()
        }
    }
    
    // MARK: - Init
    public init(interactor: NewsBusinessLogic, state: State) {
        self.interactor = interactor
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
    private func configureViews() {
        
    }
    
}
