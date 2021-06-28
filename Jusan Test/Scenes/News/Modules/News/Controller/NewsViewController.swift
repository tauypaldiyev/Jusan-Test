//
//  NewsViewController.swift
//  Jusan Test
//
//  Created by Rauan on 28.06.2021.
//

import UIKit

public final class NewsViewController: UIViewController {
    
    // MARK: - Properties
    public var page: NewsPage = .all {
        didSet {
            switch page {
            case .all:
                view.backgroundColor = .green
            case .top:
                view.backgroundColor = .yellow
            }
        }
    }
    public var state: State {
        didSet {
            updateState()
        }
    }
    
    // MARK: - Init
    public init(state: State) {
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
