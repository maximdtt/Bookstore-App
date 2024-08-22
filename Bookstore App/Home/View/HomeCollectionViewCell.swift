//
//  HomeCollectionViewCell.swift
//  Bookstore App
//
//  Created by Maksims Šalajevs on 04/08/2024.
//

import UIKit
import SnapKit
import Kingfisher

final class HomeCollectionViewCell: UICollectionViewCell {
    static let reuseID = "HomeCollectionViewCell"
    
    // MARK: - GUI Variables
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        
        view.image = UIImage(named: "cover") ?? UIImage.add
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        
        return view
    }()
    
    private lazy var blackView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .black
        view.alpha = 1
        view.layer.cornerRadius = 8
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        return view
    }()
    
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Fantasy"
        label.textColor = .gray
        label.font = .systemFont(ofSize: 10)
        
        return label
    }()
    
    private lazy var nameOfBookLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Harry Potter and something"
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 15)
        
        return label
    }()
    
    private lazy var nameOfAuthorLabel: UILabel = {
        let label = UILabel()
        
        label.text = "J.K. Rowling"
        label.textColor = .white
        label.font = .systemFont(ofSize: 11)
        
        return label
    }()
    
    // MARK: - Initializations
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    func set(books: BookCellViewModel) {
        imageView.kf.setImage(with: books.image)
        categoryLabel.text = books.subject
        nameOfBookLabel.text = books.title
        nameOfAuthorLabel.text = books.authorName
    }
    
    // MARK: - Private methods
    private func setupUI() {
        contentView.addSubviews([imageView,
                     blackView,
                     categoryLabel,
                     nameOfAuthorLabel,
                     nameOfBookLabel])
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.width.equalTo(91)
            make.height.equalTo(141)
            make.top.equalToSuperview().inset(12)
            make.leading.trailing.equalToSuperview().inset(44)
            make.centerX.equalToSuperview()
        }
        
        blackView.snp.makeConstraints { make in
            make.height.equalTo(92)
            make.bottom.trailing.leading.equalToSuperview()
        }
        
        categoryLabel.snp.makeConstraints { make in
            make.top.equalTo(blackView.snp.top).offset(10)
            make.trailing.leading.equalTo(blackView).offset(10)
        }
        
        nameOfBookLabel.snp.makeConstraints { make in
            make.top.equalTo(categoryLabel.snp.bottom)
            make.trailing.leading.equalTo(blackView).offset(10)
        }
        
        nameOfAuthorLabel.snp.makeConstraints { make in
            make.top.equalTo(nameOfBookLabel.snp.bottom).offset(8)
            make.trailing.leading.equalTo(blackView).offset(10)
        }
    }
}
