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
    /// Нужна ли тут ленивая инициализация? Есть какие-нибудь элементы которые загружаются не сразу при загрузке вью контроллера?
    /// Текст и прочие текстовые константы лучше выносить в экстеншн, что бы собрать их в одном месте, в будущем проще вносить правки другим разработчикам или самому (не обязательный коммент, но здорово если будете знать этот подход)

    private lazy var booksImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: Constants.Images.booksImageName)
        return view
    }()
    
    private lazy var unImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: Constants.Images.unImageName)
        return view
    }()
    
    private lazy var welcomeTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = Constants.Texts.welcomeText
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var getStartedButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle(Constants.Texts.getStartedButtonText, for: .normal)
        button.addTarget(self, action: #selector(goToSelectViewController), for: .touchUpInside)
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
    ///В марке указали что методы приватные, а они не приватные...
    ///что бы не забывать приватные модификаторы, есть подход выносить все приватные в приватный экстеншн, тогда не нужно будет каждый помечать как  private
}

// MARK: - Private

private extension WelcomeViewController {

    func setupUI() {
        view.backgroundColor = .white
        setupConstraints()
    }

    func setupConstraints() {
        [getStartedButton, booksImageView, unImageView, welcomeTextLabel].forEach { view.addSubview($0) }

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
            $0.width.equalTo(350)
            $0.height.equalTo(50)
        }

        welcomeTextLabel.snp.makeConstraints {
            $0.top.equalTo(unImageView.snp.bottom).inset(-20)
            $0.width.equalTo(325)
            $0.height.equalTo(100)
            $0.centerX.equalTo(unImageView.snp.centerX)
        }
    }

    @objc
    func goToSelectViewController() {
        let tabBarController = TabBarController()

        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = scene.windows.first {
            window.rootViewController = tabBarController

            UIView.transition(with: window,
                              duration: 0.5,
                              options: .transitionFlipFromRight,
                              animations: nil,
                              completion: nil)
        }
    }
}

// MARK: - Constants

private extension WelcomeViewController {
    enum Constants {
        enum Texts {
            static let welcomeText = "Read more and stress less with our online book shopping app. Shop from anywhere you are and discover titles that you love. Happy reading!"
            static let getStartedButtonText = "Get Started"
        }
        enum Images {
            static let unImageName = "unn"
            static let booksImageName = "bookswelcome"
        }
    }
}
/// И так далее, еще можно выносить числовые значения констрейнтов, если они повторяются
