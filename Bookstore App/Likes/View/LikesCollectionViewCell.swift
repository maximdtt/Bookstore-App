//
//  LikesCollectionViewCell.swift
//  Bookstore App
//
//  Created by Maksims Šalajevs on 09/08/2024.
//

import SnapKit
import UIKit
import Kingfisher

final class LikesCollectionViewCell: UICollectionViewCell {
    static let reuseID = "LikesCollectionViewCell"
    
    // MARK: - GUI Variables
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        
        view.image = UIImage(named: "bookcover")
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        
        return view
    }()
    
    private lazy var blackView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .black
        view.alpha = 1
        
        return view
    }()
    
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Fantasy"
        label.textColor = .white
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var nameOfAuthorLabel: UILabel = {
        let label = UILabel()
        
        label.text = "J.K. Rowling"
        label.textColor = .white
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var nameOfBookLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Harry Potter and something"
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 17)
        
        return label
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        

        button.tintColor = .white
        
        button.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        
        return button
    }()
    
    
    //MARK: - Properties
    var key: String?
    
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
    func set(books: BooksLikesObject) {
        imageView.kf.setImage(with: books.image)
        categoryLabel.text = books.subject
        nameOfAuthorLabel.text = books.authorName
        nameOfBookLabel.text = books.title
        key = books.key
    }
    
    @objc
    func closeAction() {
        guard let key = key else { return }
        BookPersistent.delete(key)
    }
    
    // MARK: - Private methods
    private func setupUI() {
        contentView.addSubviews([imageView, blackView])
        blackView.addSubviews([categoryLabel,
                               nameOfAuthorLabel,
                               nameOfBookLabel,
                               closeButton])
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
            make.width.equalTo(95)
        }
        
        blackView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.top)
            make.leading.equalTo(imageView.snp.trailing)
            make.bottom.trailing.equalToSuperview()
        }
        
        categoryLabel.snp.makeConstraints { make in
            make.top.equalTo(blackView.snp.top).offset(14)
            make.leading.equalTo(imageView.snp.trailing).offset(10)
        }
        
        nameOfBookLabel.snp.makeConstraints { make in
            make.leading.equalTo(categoryLabel.snp.leading)
            make.top.equalTo(categoryLabel.snp.bottom)
            make.trailing.equalToSuperview()
        }
        
        nameOfAuthorLabel.snp.makeConstraints { make in
            make.leading.equalTo(categoryLabel.snp.leading)
            make.top.equalTo(nameOfBookLabel.snp.bottom).offset(4)
            make.trailing.equalToSuperview()
        }
        
        closeButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(14)
            make.trailing.equalToSuperview().inset(9)
            make.width.equalTo(20)
        }
    }
}
