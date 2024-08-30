//
//  LikesViewController.swift
//  Bookstore App
//
//  Created by Maksims Šalajevs on 03/08/2024.
//

import SnapKit
import UIKit

final class LikesViewController: UIViewController {
    
    // MARK: - GUI Variables
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Likes"
        label.font = .boldSystemFont(ofSize: 16)
        
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: 340, height: 140)
        
        layout.minimumLineSpacing = 20
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height), collectionViewLayout: layout)

        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    
    // MARK: - Properties
    private var viewModel: LikesViewModelProtocol
    
    // MARK: - Life cycle
    init(viewModel: LikesViewModelProtocol) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        registerObserver()
        
        viewModel.reloadData = { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    // MARK: - Methods
    
    // MARK: - Private methods
    private func registerObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateData), name: NSNotification.Name("Update"), object: nil)
    }
    
    @objc
    private func updateData() {
        viewModel.getBooks()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
        
        view.addSubviews([titleLabel,collectionView])
        
        collectionView.register(LikesCollectionViewCell.self, forCellWithReuseIdentifier: LikesCollectionViewCell.reuseID)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.centerX.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(titleLabel.snp.bottom).offset(35)
        }
    }
}

// MARK: - UICollectionViewDataSource
extension LikesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfCells
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LikesCollectionViewCell.reuseID, for: indexPath) as? LikesCollectionViewCell else {
            return UICollectionViewCell()}
        cell.layer.cornerRadius = 8
        cell.layer.masksToBounds = true
        
        let book = viewModel.getBook(for: indexPath.row)
        cell.set(books: book)
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension LikesViewController: UICollectionViewDelegate {
    
}
