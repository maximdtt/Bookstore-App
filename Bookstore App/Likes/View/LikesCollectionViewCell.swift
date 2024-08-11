//
//  LikesCollectionViewCell.swift
//  Bookstore App
//
//  Created by Maksims Šalajevs on 09/08/2024.
//

import SnapKit
import UIKit

final class LikesCollectionViewCell: UICollectionViewCell {
    static let reuseID = "LikesCollectionViewCell"
    
    // MARK: - GUI Variables
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        
        view.image = UIImage(named: "bookcover")
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        
        return view
    }()
    
    
    
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        
        label.text = "\n  " + "Fantasy"
        label.textColor = .white
        label.backgroundColor = .black
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var nameOfAuthorLabel: UILabel = {
        let label = UILabel()
        
        label.text = "  " + "J.K. Rowling"
        label.textColor = .white
        label.backgroundColor = .black
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var nameOfBookLabel: UILabel = {
        let label = UILabel()
        
        label.text = "  " + "Harry Potter and something"
        label.numberOfLines = 0
        label.textColor = .white
        label.backgroundColor = .black
        label.font = .boldSystemFont(ofSize: 17)
        
        return label
    }()
    
    private lazy var blackView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .black
        
        return view
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .black
        button.tintColor = .white
        
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        return button
    }()
    
    // MARK: - Initializations
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        
        [imageView, categoryLabel, nameOfAuthorLabel, nameOfBookLabel, blackView, closeButton].forEach { addSubview($0) }
        setupConstraints()
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview()
            $0.width.equalTo(95)
        }
        
        categoryLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(imageView.snp.trailing) }
        
        nameOfBookLabel.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.trailing)
            $0.top.equalTo(categoryLabel.snp.bottom)
            $0.trailing.equalToSuperview() }
        
        closeButton.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
            $0.bottom.equalTo(nameOfBookLabel.snp.top)
            $0.leading.equalTo(categoryLabel.snp.trailing)
            $0.width.equalTo(30)
        }
        
        nameOfAuthorLabel.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.trailing)
            $0.top.equalTo(nameOfBookLabel.snp.bottom)
            $0.trailing.equalToSuperview() }
            
        blackView.snp.makeConstraints {
            $0.top.equalTo(nameOfAuthorLabel.snp.bottom)
            $0.leading.equalTo(imageView.snp.trailing)
            $0.bottom.trailing.equalToSuperview() }
      
    }
}
