//
//  CategoriesViewController.swift
//  Bookstore App
//
//  Created by Maksims Šalajevs on 03/08/2024.
//

import UIKit

final class CategoriesViewController: UIViewController {
    
    // MARK: - GUI Variables
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.layer.cornerRadius = 5
        searchBar.placeholder = "Search title/author"
        searchBar.layer.borderColor = UIColor.white.cgColor
        searchBar.layer.borderWidth = 1
        searchBar.showsBookmarkButton = true
        searchBar.setImage(UIImage(named: "flag"), for: .bookmark, state: .normal)

    //TODO:
        
        return searchBar
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 100)
        layout.minimumLineSpacing = 25
        layout.minimumInteritemSpacing = 25
        layout.sectionInset = .init(top: 25, left: 25, bottom: 25, right: 25)
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - searchBar.frame.height), collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.layer.borderColor = UIColor.white.cgColor
        layout.sectionHeadersPinToVisibleBounds = true

        return collectionView
    }()
    
    // MARK: - Properties
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    // MARK: - Methods
    
    // MARK: - Private methods
    
    private func setupUI() {
        view.backgroundColor = .white
        [searchBar, collectionView].forEach { view.addSubview($0) }
        
        collectionView.register(CategoriesCollectionViewCell.self, forCellWithReuseIdentifier: CategoriesCollectionViewCell.reuseID)
                
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        searchBar.snp.makeConstraints { $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)}
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(5)
            $0.bottom.equalTo(view.safeAreaLayoutGuide) }

    }
}

// MARK: - UICollectionViewDataSource

extension CategoriesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.reuseID, for: indexPath) as? CategoriesCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension CategoriesViewController: UICollectionViewDelegate {
    
}

