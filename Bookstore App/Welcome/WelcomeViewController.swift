//
//  WelcomeViewController.swift
//  Bookstore App
//
//  Created by Maksims Šalajevs on 11/08/2024.
//
import SnapKit
import UIKit

final class WelcomeViewController: UIViewController {
    
    // MARK: - GUI Variables
    
    private lazy var booksImageView: UIImageView = {
        let view = UIImageView()
        
        view.image = UIImage(named: "bookswelcome")
        
        return view
    }()
    
    private lazy var unImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "unn")
        return view
    }()
    
    private lazy var getStartedButton: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .black
        button.setTitle("Get Started", for: .normal)
        button.addTarget(self, action: #selector(goToSelectViewController), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 350),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
        button.layer.cornerRadius = 5
        
        
        return button
    }()
    
    // MARK: - Properties
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Methods
    
    // MARK: - Private methods
    
    func setupUI() {
        view.backgroundColor = .white
        setupConstraints()
    }
    
    func setupConstraints() {
        [getStartedButton, booksImageView, unImageView].forEach { view.addSubview($0)}
        
        booksImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(350)
        }
        
        unImageView.snp.makeConstraints {
            $0.bottom.equalTo(booksImageView.snp.bottom)
            $0.centerX.equalToSuperview()
        }
        
        getStartedButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(100)
            $0.centerX.equalToSuperview()
            
            
        }
        
        
    }
    
    @objc
    private func goToSelectViewController() {
        let tabBarController = TabBarController()

        if let window = UIApplication.shared.windows.first {
                    window.rootViewController = tabBarController

                    UIView.transition(with: window,
                                      duration: 0.5,
                                      options: .transitionFlipFromRight,
                                      animations: nil,
                                      completion: nil)
                }
            }
}
