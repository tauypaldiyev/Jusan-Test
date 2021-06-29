//
//  NewsCell.swift
//  Jusan Test
//
//  Created by Rauan on 29.06.2021.
//

import Kingfisher
import UIKit

public protocol NewsCellDelegate: AnyObject {
    func cell(_ cell: NewsCell, didTappedFavoriteButton button: UIButton)
}

public final class NewsCell: UITableViewCell {
    
    // MARK: - Properties
    public weak var delegate: NewsCellDelegate?
    
    // MARK: - Views
    private lazy var headerView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()
    private lazy var newsImageView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        return view
    }()
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        return view
    }()
    private lazy var authorLabel = UILabel()
    private lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.textAlignment = .center
        return view
    }()
    private lazy var favoriteButton: UIButton = {
        let view = UIButton()
        view.addTarget(self, action: #selector(didTappedFavorite(_:)), for: .touchUpInside)
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
    @objc
    private func didTappedFavorite(_ sender: UIButton) {
        delegate?.cell(self, didTappedFavoriteButton: sender)
    }
    
    public func configure(with viewModel: NewsCellProtocol) {
        newsImageView.kf.setImage(with: viewModel.imageURL)
        titleLabel.attributedText = viewModel.title
        authorLabel.attributedText = viewModel.author
        descriptionLabel.attributedText = viewModel.description
        favoriteButton.setImage(viewModel.favoriteIcon, for: .normal)
    }
    
    private func configureViews() {
        selectionStyle = .none
        [headerView].forEach {
            contentView.addSubview($0)
        }
        [newsImageView, titleLabel, authorLabel, descriptionLabel, favoriteButton].forEach {
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
            make.top.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(10)
            make.size.equalTo(CGSize(width: 70, height: 50))
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalTo(newsImageView.snp.trailing).offset(10)
            make.trailing.equalTo(favoriteButton.snp.leading).offset(-10)
        }
        authorLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.leading.equalTo(newsImageView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(10)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(newsImageView.snp.bottom).offset(10)
            make.top.greaterThanOrEqualTo(authorLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(20)
        }
        favoriteButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(10)
            make.size.equalTo(CGSize(width: 30, height: 30))
        }
    }
    
    private func configureColors() {
        authorLabel.textColor = .gray
        descriptionLabel.textColor = .darkGray
        headerView.backgroundColor = .lightGray
        titleLabel.textColor = .white
    }
    
}
