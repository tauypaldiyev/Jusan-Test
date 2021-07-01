//
//  NewsTabViewController.swift
//  Jusan Test
//
//  Created by Rauan on 28.06.2021.
//

import UIKit

public final class NewsTabViewController: UIViewController {
    
    // MARK: - Properties
    public lazy var pagerViewController: NewsPagerViewController = {
        guard let controller = NewsPagerBuilder(state: .initial([.all, .top])).build() as? NewsPagerViewController else {
            return NewsPagerViewController(state: .initial([]))
        }
        
        controller.pagerDelegate = self
        return controller
    }()
    public var selectedIndexPath = IndexPath(row: .zero, section: .zero)
    public let sections: [Section] = [
        .init(section: .section, rows: [.all, .top].compactMap { .page($0) })
    ]
    public var state: State {
        didSet {
            updateState()
        }
    }
    
    // MARK: - Views
    public lazy var mainView: NewsTabView = {
        let view = NewsTabView()
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
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
        [pagerViewController].forEach {
            addChild($0)
        }
        [mainView, pagerViewController.view].forEach {
            view.addSubview($0)
        }
     
        configureColors()
        makeConstraints()
    }
    
    private func makeConstraints() {
        mainView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(80)
        }
        pagerViewController.view.snp.makeConstraints { make in
            make.top.equalTo(mainView.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func configureColors() {
        view.backgroundColor = .white
    }
    
}
