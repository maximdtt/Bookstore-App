//
//  HomeCollectionViewCell.swift
//  Bookstore App
//
//  Created by Maksims Šalajevs on 04/08/2024.
//

import UIKit

final class HomeCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "HomeCollectionViewCell"
    
    // MARK: - GUI Variables
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        
        view.image = UIImage(named: "cover") ?? UIImage.add
        view.contentMode = .scaleAspectFill
        
        return view
    }()
    
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Fantasy"
        label.textColor = .white
        label.backgroundColor = .black
        
        return label
    }()
    
    private lazy var nameOfAuthorLabel: UILabel = {
        let label = UILabel()
        
        label.text = "J.K. Rowling"
        label.textColor = .white
        label.backgroundColor = .black
        
        return label
    }()
    
    private lazy var nameOfBookLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Harry Potter and something"
        label.numberOfLines = 0
        label.textColor = .white
        label.backgroundColor = .black
        
        return label
    }()
    
    
    // MARK: - Initializations
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    
    
    // MARK: - Private methods
    
    private func setupUI() {
        [imageView, categoryLabel, nameOfBookLabel, nameOfAuthorLabel].forEach { addSubview($0) }
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        imageView.snp.makeConstraints { $0.size.edges.equalToSuperview() }
        
        categoryLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview() }
        
        nameOfBookLabel.snp.makeConstraints {
            $0.top.equalTo(categoryLabel.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        nameOfAuthorLabel.snp.makeConstraints {
            $0.top.equalTo(nameOfBookLabel.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
    }
    
}
