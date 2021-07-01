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
            filter = Filter()
        }
    }
    public var filter: Filter? {
        didSet {
            switch page {
            case .all:
                getAllNews()
            case .top:
                getTopNews()
            case .favorites:
                getFavorites()
            }
        }
    }
    public var state: State {
        didSet {
            updateState()
        }
    }
    
    // MARK: - Views
    public lazy var mainView: NewsView = {
        let view = NewsView()
        view.dataSource = self
        view.delegate = self
        view.infiniteScrollDelegate = self
        view.refreshControl = refreshControl
        return view
    }()
    public lazy var refreshControl: UIRefreshControl = {
        let view = UIRefreshControl()
        view.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
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
    @objc
    public func refresh(_ sender: UIRefreshControl) {
        filter?.page = 1
    }
    
    private func configureNews() {
        sections.append(.init(section: .section, rows: news.compactMap { _ in .news }))
        mainView.reloadData()
    }
    
    private func configureViews() {
        [mainView].forEach {
            view.addSubview($0)
        }
        
        configureColors()
        makeConstraints()
    }
    
    private func makeConstraints() {
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func configureColors() {
        view.backgroundColor = .white
    }
    
}
