//
//  CategoriesViewController.swift
//  Bookstore App
//
//  Created by Maksims Šalajevs on 03/08/2024.
//
import SnapKit
import UIKit

final class CategoriesViewController: UIViewController {
    
    // MARK: - GUI Variables
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.layer.cornerRadius = 5
        searchBar.placeholder = "Search title/author/ISBN no"
        searchBar.searchTextField.bounds = searchStackView.frame
        searchBar.layer.borderColor = UIColor.white.cgColor
        searchBar.layer.borderWidth = 1
        searchBar.searchTextField.font = .systemFont(ofSize: 18)
        return searchBar
    }()
    
    private lazy var filterButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "book"), for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 10
        return button
    }()
    
    private lazy var searchStackView: UIStackView = {
        let searchStackView = UIStackView()
        searchStackView.axis = .horizontal
        searchStackView.spacing = 8
        return searchStackView
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
        layout.headerReferenceSize = CGSize(width: view.frame.width, height: 20)

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
        [searchBar, filterButton].forEach { searchStackView.addSubview($0) }
        [searchStackView, collectionView].forEach { view.addSubview($0) }
        
        collectionView.register(CategoriesCollectionViewCell.self, forCellWithReuseIdentifier: CategoriesCollectionViewCell.reuseID)
        collectionView.register(CategoryHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CategoryHeaderView.reuseID)

        setupConstraints()
    }
    
    private func setupConstraints() {
        
        searchStackView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(100)
            
        }

        searchBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.width.equalTo(275)
        }

        filterButton.snp.makeConstraints {
            $0.trailing.equalTo(view.safeAreaLayoutGuide).inset(30)
            $0.width.height.equalTo(53)
            $0.centerY.equalTo(searchBar)
        }
         
        collectionView.snp.makeConstraints {
            $0.top.equalTo(searchStackView.snp.bottom).inset(-30)
            $0.leading.trailing.equalToSuperview().inset(5)
            $0.bottom.equalTo(view.safeAreaLayoutGuide) }
    }
}

// MARK: - UICollectionViewDataSource

extension CategoriesViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader,
              let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CategoryHeaderView.reuseID, for: indexPath) as? CategoryHeaderView else {
            return UICollectionReusableView()
        }

        return header
    }

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

