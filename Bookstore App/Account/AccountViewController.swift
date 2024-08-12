//
//  AccountViewController.swift
//  Bookstore App
//
//  Created by Maksims Šalajevs on 03/08/2024.
//
import SnapKit
import UIKit

final class AccountViewController: UIViewController {
    
    
    
    // MARK: - GUI Variables
    
    private lazy var accImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "person.circle.fill")
        return view
    }()
    
    private lazy var accLabel: UILabel = {
        let label = UILabel()
        label.text = "   Name: " + "          Your Name "
        label.backgroundColor = .lightGray
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        
        return label
    }()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        

    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        title = "Account"
        view.backgroundColor = .white
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        [accImage, accLabel].forEach { view.addSubview($0) }
        
        accImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(200)
            $0.width.height.equalTo(120)
        }
        
        accLabel.snp.makeConstraints {
            $0.top.equalTo(accImage.snp.bottom).inset(-20)
            $0.centerX.equalTo(accImage.snp.centerX)
            $0.width.equalTo(320)
            $0.height.equalTo(55)
        }
    }
}
