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
    public var news: [NewsDTO] = [] {
        didSet {
            configureNews()
        }
    }
    public var sections = [Section]()
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
    
    // MARK: - Views
    private lazy var mainView: NewsView = {
        let view = NewsView()
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
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
    private func configureNews() {
        sections.append(.init(section: .section, rows: news.compactMap { _ in .news }))
        mainView.reloadData()
    }
    
    private func configureViews() {
        [mainView].forEach {
            view.addSubview($0)
        }
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
