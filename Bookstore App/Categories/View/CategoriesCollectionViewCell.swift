//
//  CategoriesCollectionViewCell.swift
//  Bookstore App
//
//  Created by Maksims Šalajevs on 05/08/2024.
//

import UIKit

final class CategoriesCollectionViewCell: UICollectionViewCell {
    static let reuseID = "CategoriesCollectionViewCell"
    
    // MARK: - GUI Variables
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        
        view.image = UIImage(named: "Image")
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
            
        return view
    }()
    
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Category"
        label.textAlignment = .center
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 16)
        
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
    
    // MARK: - Private methods
    
    private func setupUI() {
        [imageView, categoryLabel].forEach { addSubview($0) }
        setupConstraints()
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { $0.size.edges.equalToSuperview() }
        categoryLabel.snp.makeConstraints { $0.height.bottom.leading.trailing.equalTo(imageView) }
    }
}
