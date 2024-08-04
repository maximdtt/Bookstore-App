//
//  HomeViewController.swift
//  Bookstore App
//
//  Created by Maksims Šalajevs on 03/08/2024.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    // MARK: - GUI Variables
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 176, height: 232)
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 365, height: 319), collectionViewLayout: layout)
        
        
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
        view.addSubview(collectionView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
    }
}

