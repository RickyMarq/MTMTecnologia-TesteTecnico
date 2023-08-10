//
//  HomeCell.swift
//  MTMTecnologia-TesteTecnico
//
//  Created by Henrique Marques on 03/08/23.
//

import UIKit
import SDWebImage
import SkeletonView

class HomeCell: UICollectionViewCell {
    
    static let identifier = "HomeCell"
    var viewModel: HomeCellViewModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViewCode()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    lazy var charactersImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.roundCorners([.topLeft, .topRight], radius: 12.0)
        imageView.isSkeletonable = true
        return imageView
    }()
    
    lazy var gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.white.withAlphaComponent(0.0).cgColor, UIColor.black.withAlphaComponent(0.5).cgColor]
        gradient.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.frame = self.charactersImageView.bounds
        return gradient
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
    
    lazy var charactersName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.textAlignment = .left
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.lineBreakMode = .byWordWrapping
        label.isSkeletonable = true
        label.linesCornerRadius = 7
        return label
    }()
    
    lazy var createdCharacters: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.textAlignment = .left
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.lineBreakMode = .byWordWrapping
        label.isSkeletonable = true
        label.linesCornerRadius = 7
        return label
    }()
    
    lazy var speciesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.lineBreakMode = .byWordWrapping
        label.isSkeletonable = true
        label.linesCornerRadius = 7
        return label
    }()
    
    lazy var locationCharacters: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.textAlignment = .left
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.lineBreakMode = .byWordWrapping
        label.isSkeletonable = true
        label.linesCornerRadius = 7
        return label
    }()
    
    func prepareCell(data: ResultData) {
        self.viewModel = HomeCellViewModel(objc: data)
        self.charactersName.text = viewModel?.name
        self.charactersImageView.sd_setImage(with: URL(string: data.image ?? ""))
        self.aliveLabel.text = viewModel?.alive
        let convertedDate = viewModel?.convertCreated(viewModel?.created ?? "")
        self.createdCharacters.text = "\(convertedDate?.capitalizedSentence ?? "") • \(viewModel?.species ?? "")"
        self.locationCharacters.text = viewModel?.locationName
        DispatchQueue.main.async {
            self.charactersImageView.layer.insertSublayer(self.gradient, at: .min)
        }
    }
}

extension HomeCell: ViewCode {
    
    func configureSubViews() {
        self.contentView.addSubview(self.charactersName)
        self.contentView.addSubview(self.charactersImageView)
        self.charactersImageView.addSubview(self.aliveView)
        self.aliveView.addSubview(self.aliveLabel)
        self.contentView.addSubview(self.createdCharacters)
        self.contentView.addSubview(self.locationCharacters)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            
            self.charactersImageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.charactersImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.charactersImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.charactersImageView.heightAnchor.constraint(equalToConstant: 200),
            
            self.charactersName.topAnchor.constraint(equalTo: self.charactersImageView.bottomAnchor, constant: 12),
            self.charactersName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            self.charactersName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            
            self.aliveView.topAnchor.constraint(equalTo: self.charactersImageView.topAnchor, constant: 12),
            self.aliveView.rightAnchor.constraint(equalTo: self.charactersImageView.rightAnchor, constant: -20),
            self.aliveView.heightAnchor.constraint(equalToConstant: 30),
            self.aliveView.widthAnchor.constraint(equalToConstant: 80),
            
            self.aliveLabel.centerXAnchor.constraint(equalTo: self.aliveView.centerXAnchor),
            self.aliveLabel.centerYAnchor.constraint(equalTo: self.aliveView.centerYAnchor),
            
            self.createdCharacters.topAnchor.constraint(equalTo: self.charactersName.bottomAnchor, constant: 12),
            self.createdCharacters.leadingAnchor.constraint(equalTo: self.charactersName.leadingAnchor),
            self.createdCharacters.trailingAnchor.constraint(equalTo: self.charactersName.trailingAnchor),
            
            self.locationCharacters.topAnchor.constraint(equalTo: self.createdCharacters.bottomAnchor, constant: 4),
            self.locationCharacters.leadingAnchor.constraint(equalTo: self.createdCharacters.leadingAnchor),
            self.locationCharacters.trailingAnchor.constraint(equalTo: self.createdCharacters.trailingAnchor),
        ])
    }
    
    func configureAdditionalBehaviors() {
        self.setShadow(view: self)
        self.isSkeletonable = true
        self.backgroundColor = .secondarySystemBackground
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10
    }
    
    func configureAccessibility() { }
}
