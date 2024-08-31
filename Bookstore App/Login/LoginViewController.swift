//
//  LoginViewController.swift
//  Bookstore App
//
//  Created by Анна on 29.08.2024.
//

import Foundation
import UIKit
import SnapKit
import FirebaseAuth

class LoginViewController: UIViewController {
    //MARK: - GUI Variables
    private lazy var accTitleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Account"
        label.font = .boldSystemFont(ofSize: 16)
        
        return label
    }()
    
    private lazy var contentView: UIView = UIView()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        
        view.axis = .vertical
        view.alignment = .leading
        view.spacing = 8
        
        return view
    }()
    
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
        view.clearButtonMode = .whileEditing
        
        return view
    }()
    
    private lazy var passwordContainerView: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor(red: 222/255, green: 222/255, blue: 222/255, alpha: 1.0)
        view.layer.cornerRadius = 5
        
        return view
    }()
    
    private lazy var passwordLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Password:"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 14)
        
        return label
    }()
    
    private lazy var passwordTextField: UITextField = {
        let view = UITextField()
        
        view.text = "12345"
        view.textColor = .black
        view.font = .systemFont(ofSize: 14)
        view.isSecureTextEntry = true
        view.clearButtonMode = .whileEditing
        
        return view
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("LOGIN / SIGN UP", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(self.goToAccount), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextFiled.delegate = self
        passwordTextField.delegate = self
        
        
        setupUI()
    }
    
    //MARK: - Private methods
    private func setupUI() {
        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
        
        view.addSubviews([accTitleLabel, contentView])
        contentView.addSubview(stackView)
        stackView.addSubviews([ accImage,
                                loginContainerView,
                                passwordContainerView,
                                loginButton])
        loginContainerView.addSubviews([loginLabel, loginTextFiled])
        passwordContainerView.addSubviews([passwordLabel, passwordTextField])
        setupConstraints()
    }
    
    private func setupConstraints() {
        loginLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        loginLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        
        loginTextFiled.setContentHuggingPriority(.defaultLow, for: .horizontal)
        loginTextFiled.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        passwordLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        passwordLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        
        passwordTextField.setContentHuggingPriority(.defaultLow, for: .horizontal)
        passwordTextField.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        accTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.centerX.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.top.equalTo(accTitleLabel.snp.bottom).offset(32)
            make.width.equalTo(view.safeAreaLayoutGuide.snp.width)
            make.height.equalTo(view.safeAreaLayoutGuide.snp.height)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.leading.trailing.equalTo(contentView).inset(20)
            make.height.equalTo(contentView)
        }
        
        accImage.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.top).offset(32)
            make.centerX.equalTo(stackView)
            make.width.height.equalTo(100)
        }
        
        loginContainerView.snp.makeConstraints { make in
            make.top.equalTo(accImage.snp.bottom).offset(28)
            make.leading.equalTo(stackView.snp.leading)
            make.width.equalTo(stackView)
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
        
        passwordContainerView.snp.makeConstraints { make in
            make.top.equalTo(loginContainerView.snp.bottom).offset(28)
            make.leading.equalTo(stackView.snp.leading)
            make.width.equalTo(stackView)
            make.height.equalTo(56)
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordContainerView.snp.top)
            make.leading.equalTo(passwordContainerView.snp.leading).offset(13)
            make.width.equalTo(70)
            make.centerY.equalTo(passwordContainerView)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.top)
            make.leading.equalTo(passwordLabel.snp.trailing).offset(20)
            make.trailing.equalTo(passwordContainerView.snp.trailing).inset(13)
            make.height.equalTo(passwordContainerView.snp.height)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(28)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(50)
        }
    }
    
    private func loginOrSignup() {
        guard let login = loginTextFiled.text, !login.isEmpty,
              let password = passwordTextField.text, !password.isEmpty, password.count > 5 else {
            showAlert()
            return
        }
        
        Auth.auth().signIn(withEmail: login, password: password) { result, error in
            if let error = error {
                print(error)
                self.createUser(login: login, password: password)
            } else {
                self.goToWelcome()
            }
        }
    }
    
    private func createUser(login: String, password: String) {
        Auth.auth().createUser(withEmail: login, password: password) { result, error in
            if let error = error {
                self.showAlert()
            } else {
                self.goToWelcome()
            }
        }
    }
    
    private func goToWelcome() {
        let vc = WelcomeViewController()
        self.view.window?.rootViewController = vc
        self.view.window?.makeKeyAndVisible()
    }
    
    @objc
    func goToAccount() {
        loginOrSignup()
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Error", message: "Fill all fields/Password must be > 6", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        loginOrSignup()
        
        return true
    }
}
