//
//  HomeSectionView.swift
//  Bookstore App
//
//  Created by Анна on 11.08.2024.
//

import Foundation
import UIKit
import SnapKit

class HomeSectionView: UIView {
    // MARK: - GUI Variables
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.text = "Top Books"
        label.textAlignment = .left
        
        return label
    }()
    
    private lazy var seeMoreButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("see more", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        
        return button
    }()
    
    private lazy var weekButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("This Week", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = cornerRadius
        button.layer.borderColor = borderColor
        button.layer.borderWidth = borderWidth
        button.titleLabel?.font = fond
        
        return button
    }()
    
    private lazy var monthButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("This Month", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = cornerRadius
        button.layer.borderColor = borderColor
        button.layer.borderWidth = borderWidth
        button.titleLabel?.font = fond
        
        return button
    }()
    
    private lazy var yearButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("This Year", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = cornerRadius
        button.layer.borderColor = borderColor
        button.layer.borderWidth = borderWidth
        button.titleLabel?.font = fond
        
        return button
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 176, height: 232)
        layout.minimumLineSpacing = 16
        
        let collectionView = UICollectionView(frame: CGRect.zero,
                                              collectionViewLayout: layout)
        
        layout.scrollDirection = .horizontal
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    
    
    // MARK: - Properties
    private let cornerRadius: CGFloat = 6
    private let borderColor: CGColor = UIColor.black.cgColor
    private let fond: UIFont = .boldSystemFont(ofSize: 14)
    private let borderWidth: CGFloat = 1
    
    private var viewModel: HomeViewModel
    
    // MARK: - Initializations
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(frame: CGRect.zero)
        setupViewModel()
        
        setupUI()
        
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.reuseID)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    private func setupViewModel() {
        viewModel.reloadData = { [weak self] in
            self?.collectionView.reloadData()
        }
        
        viewModel.showError = { error in
            //TODO: Show alert with error
            print(error)
        }
    }
    
    func setTitle(title: String) {
        titleLabel.text = title
    }
    
    func hiddenNav() {
        self.weekButton.isHidden = true
        self.monthButton.isHidden = true
        self.yearButton.isHidden = true
        self.collectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
        }
    }
    
    // MARK: - Private methods
    private func setupUI() {
        
        addSubviews([titleLabel,
                     seeMoreButton,
                     weekButton,
                     monthButton,
                     yearButton,
                     collectionView])
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(16)
            make.leading.equalToSuperview().inset(20)
        }
        
        seeMoreButton.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(16)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).inset(16)
        }
        
        weekButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().inset(20)
            make.width.equalTo(86)
            make.height.equalTo(32)
        }
        
        monthButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.equalTo(weekButton.snp.trailing).offset(16)
            make.width.equalTo(93)
            make.height.equalTo(32)
        }
        
        yearButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.equalTo(monthButton.snp.trailing).offset(16)
            make.width.equalTo(79)
            make.height.equalTo(32)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(weekButton.snp.bottom).offset(16)
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview().inset(20)
            make.height.equalTo(232)
        }
    }
}

// MARK: - UICollectionViewDataSource
extension HomeSectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.viewModel.numberOfCells
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.reuseID, for: indexPath) as? HomeCollectionViewCell else { return UICollectionViewCell() }
        cell.backgroundColor = UIColor(red: 184/255, green: 184/255, blue: 184/255, alpha: 1.0)
        cell.layer.cornerRadius = 8
        
        let book = self.viewModel.getBook(for: indexPath.row)
        cell.set(books: book)
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension HomeSectionView: UICollectionViewDelegate {
    
}
