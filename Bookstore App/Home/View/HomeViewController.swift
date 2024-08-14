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
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.text = "Happy Reading!"
        label.textAlignment = .left
        
        return label
    }()
    
    private lazy var searchButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setImage(UIImage(named: "search"), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        
        return button
    }()
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        
        view.showsVerticalScrollIndicator = false
        
        return view
    }()
    
    private lazy var contentView: UIView = UIView()
    
    private lazy var topBooksSectionView: HomeSectionView = {
        let view = HomeSectionView()
        
        return view
    }()
    
    private lazy var recentBooksSectionView: HomeSectionView = {
        let view = HomeSectionView()
        view.hiddenNav()
        view.setTitle(title: "Recent Books")
        
        return view
    }()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        
        setupUI()
    }
    
    // MARK: - Private methods
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(titleLabel)
        view.addSubview(searchButton)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews([topBooksSectionView, recentBooksSectionView])
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.leading.equalToSuperview().inset(20)
        }
        
        searchButton.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).inset(20)
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
        }
        
        topBooksSectionView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(16)
            make.leading.trailing.equalTo(contentView)
            make.height.equalTo(319)
        }
        
        recentBooksSectionView.snp.makeConstraints { make in
            make.top.equalTo(topBooksSectionView.snp.bottom).offset(16)
            make.leading.trailing.equalTo(contentView)
            make.height.equalTo(319)
            make.bottom.equalTo(contentView.snp.bottom).offset(-16)
        }
    }
}

// MARK: - UICollectionViewDelegate

extension HomeViewController: UICollectionViewDelegate {
    
}
