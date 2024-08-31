//
//  AccountViewController.swift
//  Bookstore App
//
//  Created by Maksims Šalajevs on 03/08/2024.
//
import SnapKit
import UIKit
import FirebaseAuth

final class AccountViewController: UIViewController {
    // MARK: - GUI Variables
    private lazy var accTitleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Account"
        label.font = .boldSystemFont(ofSize: 16)
        
        return label
    }()
    
    private lazy var logoutButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Logout", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor(red: 222/255, green: 222/255, blue: 222/255, alpha: 1.0)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.addTarget(self, action: #selector(self.logoutAction), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var contentView: UIView = UIView()
    
    private lazy var accImage: UIImageView = {
        let view = UIImageView()
        
        view.image = UIImage(systemName: "person.crop.circle.fill")
        
        return view
    }()
    
    private  lazy var loginContainerView: UIView = {
        let view = UIView()
        
        view.backgroundColor =  UIColor(red: 222/255, green: 222/255, blue: 222/255, alpha: 1.0)
        view.layer.cornerRadius = 5
        
        return view
    }()
    
    private lazy var loginLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Login:"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 14)
        
        return label
    }()
    
    private lazy var loginTextFiled: UITextField = {
        let view = UITextField()
        
        view.text = "John Doe"
        view.textColor = .black
        view.font = .systemFont(ofSize: 14)
        view.textAlignment = .left
        
        return view
    }()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        getCurrentUser()
    }
    
    // MARK: - Private methods
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubviews([accTitleLabel, logoutButton, contentView])
        contentView.addSubviews([accImage,loginContainerView])
        loginContainerView.addSubviews([loginLabel, loginTextFiled])
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        loginLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        loginLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        
        loginTextFiled.setContentHuggingPriority(.defaultLow, for: .horizontal)
        loginTextFiled.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        accTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.centerX.equalToSuperview()
        }
        
        logoutButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.trailing.equalToSuperview().inset(20)
            make.width.equalTo(60)
        }
        
        contentView.snp.makeConstraints { make in
            make.top.equalTo(accTitleLabel.snp.bottom).offset(32)
            make.width.equalTo(view.safeAreaLayoutGuide.snp.width)
            make.height.equalTo(view.safeAreaLayoutGuide.snp.height)
        }
        
        accImage.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(32)
            make.centerX.equalTo(contentView)
            make.width.height.equalTo(100)
        }
        
        loginContainerView.snp.makeConstraints { make in
            make.top.equalTo(accImage.snp.bottom).offset(28)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(56)
        }
        
        loginLabel.snp.makeConstraints { make in
            make.top.equalTo(loginContainerView.snp.top)
            make.leading.equalTo(loginContainerView.snp.leading).offset(13)
            make.centerY.equalTo(loginContainerView)
        }
        
        loginTextFiled.snp.makeConstraints { make in
            make.top.equalTo(loginLabel.snp.top)
            make.leading.equalTo(loginLabel.snp.trailing).offset(20)
            make.trailing.equalTo(loginContainerView.snp.trailing).inset(13)
            make.height.equalTo(loginContainerView.snp.height)
        }
    }
    
    private func getCurrentUser() {
        if let user = Auth.auth().currentUser {
            loginTextFiled.text = user.email
        }
    }
    
    @objc
    func logoutAction() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}
