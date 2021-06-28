//
//  NewsTabCell.swift
//  Jusan Test
//
//  Created by Rauan on 28.06.2021.
//

import SnapKit
import UIKit

public final class NewsTabCell: UICollectionViewCell {
    
    public override var isSelected: Bool {
        didSet {
            configureColors()
        }
    }
    
    // MARK: - Properties
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.textAlignment = .center
        return view
    }()
    
    // MARK: - Init
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    // MARK: - Methods
    public func configure(with viewModel: NewsTabCellProtocol) {
        titleLabel.attributedText = viewModel.title
    }
    
    private func configureViews() {
        [titleLabel].forEach {
            contentView.addSubview($0)
        }
        
        configureColors()
        makeConstraints()
    }
    
    private func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func configureColors() {
        backgroundColor = .clear
        titleLabel.textColor = isSelected
            ? .black
            : .gray
    }
    
}
