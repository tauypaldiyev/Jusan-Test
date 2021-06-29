//
//  NewsCell.swift
//  Jusan Test
//
//  Created by Rauan on 29.06.2021.
//

import Kingfisher
import UIKit

public final class NewsCell: UITableViewCell {
    
    // MARK: - Views
    private lazy var headerView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()
    private lazy var newsImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        return view
    }()
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.textAlignment = .center
        return view
    }()
    private lazy var authorLabel = UILabel()
    private lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        return view
    }()
    
    // MARK: - Init
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    // MARK: - Methods
    public func configure(with viewModel: NewsCellProtocol) {
        newsImageView.kf.setImage(with: viewModel.imageURL)
        titleLabel.attributedText = viewModel.title
        authorLabel.attributedText = viewModel.author
        descriptionLabel.attributedText = viewModel.description
    }
    
    private func configureViews() {
        selectionStyle = .none
        [headerView].forEach {
            contentView.addSubview($0)
        }
        [newsImageView, titleLabel, authorLabel, descriptionLabel].forEach {
            headerView.addSubview($0)
        }
        
        configureColors()
        makeConstraints()
    }
    
    private func makeConstraints() {
        headerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        newsImageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(10)
            make.bottom.lessThanOrEqualToSuperview().inset(20)
            make.size.equalTo(CGSize(width: 50, height: 50))
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(10)
        }
        authorLabel.snp.makeConstraints { make in
            make.top.equalTo(newsImageView.snp.top)
            make.leading.equalTo(newsImageView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(10)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(authorLabel.snp.bottom).offset(5)
            make.leading.equalTo(newsImageView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.bottom.lessThanOrEqualToSuperview().inset(20)
        }
    }
    
    private func configureColors() {
        authorLabel.textColor = .gray
        descriptionLabel.textColor = .darkGray
        headerView.backgroundColor = .lightGray
        titleLabel.textColor = .white
    }
    
}
