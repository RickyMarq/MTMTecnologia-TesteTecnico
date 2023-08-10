//
//  CharacterView.swift
//  MTMTecnologia-TesteTecnico
//
//  Created by Henrique Marques on 03/08/23.
//

import UIKit

class CharacterItemView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViewCode()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isScrollEnabled = true
        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    lazy var characterItemContentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        return view
    }()
    
    lazy var characterStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var idLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.text = "#"
        return label
    }()
    
    lazy var characterNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    
    lazy var characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.roundCorners(.allCorners, radius: 10)
        return imageView
    }()
    
    lazy var aliveView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor.green.cgColor
        view.layer.shadowOpacity = 3
        view.layer.shadowOffset = CGSize(width: 3, height: 3)
        view.layer.shadowRadius = 10
        return view
    }()
    
    lazy var aliveLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .label
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.isSkeletonable = true
        label.linesCornerRadius = 7
        return label
    }()
    
    lazy var informationView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        view.backgroundColor = .secondarySystemBackground
        return view
    }()
    
    lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Location"
        label.lineBreakMode = .byWordWrapping
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.isSkeletonable = true
        label.linesCornerRadius = 7
        return label
    }()
    
    lazy var locationCharacters: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.textAlignment = .right
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.lineBreakMode = .byWordWrapping
        label.isSkeletonable = true
        label.linesCornerRadius = 7
        return label
    }()
    
    lazy var originView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        view.backgroundColor = .secondarySystemBackground
        return view
    }()
    
    lazy var originLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Origin"
        label.lineBreakMode = .byWordWrapping
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.isSkeletonable = true
        label.linesCornerRadius = 7
        return label
    }()
    
    lazy var originCharacters: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.textAlignment = .right
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.lineBreakMode = .byWordWrapping
        label.isSkeletonable = true
        label.linesCornerRadius = 7
        return label
    }()
}

extension CharacterItemView: ViewCode {
    
    func configureSubViews() {
        self.addSubview(self.scrollView)
        self.scrollView.addSubview(self.characterItemContentView)
        self.characterItemContentView.addSubview(self.characterStackView)
        self.characterStackView.addArrangedSubview(self.idLabel)
        self.characterStackView.addArrangedSubview(self.characterNameLabel)
        self.characterStackView.addArrangedSubview(self.characterImageView)
        self.characterImageView.addSubview(self.aliveView)
        self.aliveView.addSubview(self.aliveLabel)
        self.characterStackView.addArrangedSubview(self.informationView)
        self.informationView.addSubview(self.locationLabel)
        self.informationView.addSubview(self.locationCharacters)
        self.characterStackView.addArrangedSubview(self.originView)
        self.originView.addSubview(self.originLabel)
        self.originView.addSubview(self.originCharacters)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            
            self.scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.scrollView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            self.scrollView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            self.characterItemContentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.characterItemContentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            self.characterItemContentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            self.characterItemContentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            self.characterItemContentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
            
            self.characterStackView.topAnchor.constraint(equalTo: self.characterItemContentView.topAnchor, constant: 20),
            self.characterStackView.leadingAnchor.constraint(equalTo: self.characterItemContentView.leadingAnchor, constant: 20),
            self.characterStackView.trailingAnchor.constraint(equalTo: self.characterItemContentView.trailingAnchor, constant: -20),
            self.characterStackView.bottomAnchor.constraint(equalTo: self.characterItemContentView.bottomAnchor, constant: -20),
            
            self.aliveView.topAnchor.constraint(equalTo: self.characterImageView.topAnchor, constant: 12),
            self.aliveView.rightAnchor.constraint(equalTo: self.characterImageView.rightAnchor, constant: -20),
            self.aliveView.heightAnchor.constraint(equalToConstant: 30),
            self.aliveView.widthAnchor.constraint(equalToConstant: 80),
            
            self.aliveLabel.centerXAnchor.constraint(equalTo: self.aliveView.centerXAnchor),
            self.aliveLabel.centerYAnchor.constraint(equalTo: self.aliveView.centerYAnchor),
            
            self.locationLabel.topAnchor.constraint(equalTo: self.informationView.topAnchor, constant: 10),
            self.locationLabel.leadingAnchor.constraint(equalTo: self.informationView.leadingAnchor, constant: 20),
            self.locationLabel.trailingAnchor.constraint(equalTo: self.locationCharacters.leadingAnchor),
            self.locationLabel.bottomAnchor.constraint(equalTo: self.informationView.bottomAnchor, constant: -10),
            
            self.locationCharacters.topAnchor.constraint(equalTo: self.locationLabel.topAnchor),
            self.locationCharacters.rightAnchor.constraint(equalTo: self.informationView.rightAnchor, constant: -20),
            self.locationCharacters.bottomAnchor.constraint(equalTo: self.locationLabel.bottomAnchor),
            
            
            self.originLabel.topAnchor.constraint(equalTo: self.originView.topAnchor, constant: 10),
            self.originLabel.leadingAnchor.constraint(equalTo: self.originView.leadingAnchor, constant: 20),
            self.originLabel.trailingAnchor.constraint(equalTo: self.originCharacters.leadingAnchor),
            self.originLabel.bottomAnchor.constraint(equalTo: self.originView.bottomAnchor, constant: -10),
            
            self.originCharacters.topAnchor.constraint(equalTo: self.originLabel.topAnchor),
            self.originCharacters.rightAnchor.constraint(equalTo: self.originView.rightAnchor, constant: -20),
            self.originCharacters.bottomAnchor.constraint(equalTo: self.originLabel.bottomAnchor),
            
        ])
    }
    
    func configureAdditionalBehaviors() {
        self.backgroundColor = .systemBackground
    }
    
    func configureAccessibility() { }
}
