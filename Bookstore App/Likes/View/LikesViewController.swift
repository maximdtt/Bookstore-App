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
        print(1111)
        viewModel.getBooks()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
        
        collectionView.register(LikesCollectionViewCell.self, forCellWithReuseIdentifier: LikesCollectionViewCell.reuseID)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
}

// MARK: - UICollectionViewDataSource
extension LikesViewController: UICollectionViewDataSource {
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfCells
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LikesCollectionViewCell.reuseID, for: indexPath) as? LikesCollectionViewCell else {
            return UICollectionViewCell()}
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        
        let book = viewModel.getBook(for: indexPath.row)
        cell.set(books: book)
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension LikesViewController: UICollectionViewDelegate {
    
}
