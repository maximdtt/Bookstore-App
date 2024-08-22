//
//  DetailsBookViewController.swift
//  Bookstore App
//
//  Created by Анна on 14.08.2024.
//

import UIKit
import SnapKit
import Kingfisher

class DetailsBookViewController: UIViewController {
    //MARK: - GUI Variables
    private lazy var backButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "backButton"), for: .normal)
        button.addTarget(self, action: #selector(self.backAction), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.text = "Fantasy"
        
        return label
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton()
        
        let image = UIImage(systemName: "heart.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24))
        button.setImage(image, for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        
        view.showsVerticalScrollIndicator = false
        
        return view
    }()
    
    private lazy var contentView: UIView = UIView()
    
    private lazy var nameOfBookLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Harry Potter and something"
        label.numberOfLines = 0
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 24)
        label.textAlignment = .left
        
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        
        view.image = UIImage(named: "cover") ?? UIImage.add
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        
        view.axis = .vertical
        view.alignment = .leading
        view.spacing = 8
        
    
        return view
    }()
    
    private lazy var titleDescriptionLabel: UILabel = {
        let label = UILabel()
        
        label.font = .boldSystemFont(ofSize: 14)
        label.text = "Description:"
        label.textAlignment = .left
        label.textColor = .black
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 14)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left
        label.text = "Oscar Wilde’s only novel is the dreamlike story of a young man who sells his soul for eternal youth and beauty. In this celebrated work Wilde forged a devastating portrait of the effects of evil and debauchery on a young aesthete in late-19th-century England. Combining elements of the Gothic horror novel and decadent French fiction, the book centers on a striking premise: As Dorian Gray sinks into a life of crime and gross sensuality, his body retains perfect youth and vigor while his recently painted portrait grows day by day into a hideous record of evil, which he Oscar Wilde’s only novel is the dreamlike story of a young man who sells his soul for eternal youth and beauty. In this celebrated work Wilde forged a devastating portrait of the effects of evil and debauchery on a young aesthete in late-19th-century England. Combining elements of the Gothic horror novel and decadent French fiction, the book centers on a striking premise: As Dorian Gray sinks into a life of crime and gross sensuality, his body retains perfect youth and vigor while his recently painted portrait grows day by day into a hideous record of evil, which he Oscar Wilde’s only novel is the dreamlike story of a young man who sells his soul for eternal youth and beauty. In this celebrated work Wilde forged a devastating portrait of the effects of evil and debauchery on a young aesthete in late-19th-century England. Combining elements of the Gothic horror novel and decadent French fiction, the book centers on a striking premise: As Dorian Gray sinks into a life of crime and gross sensuality, his body retains perfect youth and vigor while his recently painted portrait grows day by day into a hideous record of evil, which he"
        
        return label
    }()
    
    //MARK: - Properties
    private var keyValueLabels: [KeyValueLabelView] = []
    private let viewModel: DetailsViewModelProtocol
    
    // MARK: - Life Cycle
    init(viewModel: DetailsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLabels()
        setupUI()
    }
    
    //MARK: - Private methods
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubviews([backButton, titleLabel, likeButton, scrollView])
        scrollView.addSubview(contentView)
        contentView.addSubviews([nameOfBookLabel, imageView, stackView, titleDescriptionLabel, descriptionLabel])
        
        keyValueLabels.forEach { label in
            stackView.addArrangedSubview(label)
        }
        
        setupConstraints()
    }
    
    private func setupLabels() {
        nameOfBookLabel.text = viewModel.title
        imageView.kf.setImage(with: viewModel.image)
        descriptionLabel.text = viewModel.firstSentence
        titleLabel.text = viewModel.subject
        
        let labelsData = [
            ("Author:", viewModel.authorName),
            ("Category:", viewModel.subject),
            ("Rating:", String(viewModel.ratingsAverage) + "/5")
        ]
        
        keyValueLabels = labelsData.map { KeyValueLabelView(key: $0.0, value: $0.1) }
    }
    
    private func setupConstraints() {
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(25)
            make.leading.equalToSuperview().inset(20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(25)
            make.leading.equalTo(backButton.snp.trailing).offset(63)
        }
        
        likeButton.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).inset(20)
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
        }
        
        nameOfBookLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(22)
            make.leading.equalTo(contentView).inset(20)
        }
        
        imageView.snp.makeConstraints { make in
            make.height.equalTo(213)
            make.width.equalTo(137)
            make.top.equalTo(nameOfBookLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().inset(20)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(nameOfBookLabel.snp.bottom).offset(34)
            make.leading.equalTo(imageView.snp.trailing).offset(22)
        }
        
        titleDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(18)
            make.leading.equalToSuperview().inset(20)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleDescriptionLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalTo(contentView.snp.bottom).offset(-16)
        }
    }
    
    @objc
    func backAction() {
        navigationController?.popViewController(animated: true)
    }
}
