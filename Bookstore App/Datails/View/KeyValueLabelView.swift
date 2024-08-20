//
//  KeyValueLabelView.swift
//  Bookstore App
//
//  Created by Анна on 14.08.2024.
//

import UIKit
import SnapKit

final class KeyValueLabelView: UIView {
    //MARK: - GUI Variables
    private let keyLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .black
        label.font = .systemFont(ofSize: 14)
        
        return label
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 14)
        
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        
        view.axis = .horizontal
        view.spacing = 5
        view.alignment = .leading
        
        return view
    }()
    
    //MARK: - Initialization
    init(key: String, value: String) {
        super.init(frame: .zero)
        keyLabel.text = key
        valueLabel.text = value
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - methods
    private func setupUI() {
        stackView.addArrangedSubviews([keyLabel, valueLabel])
        addSubview(stackView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

