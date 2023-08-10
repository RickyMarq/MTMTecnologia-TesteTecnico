//
//  OnboardingCell.swift
//  MTMTecnologia-TesteTecnico
//
//  Created by Henrique Marques on 03/08/23.
//

import UIKit

class OnboardingCell: UICollectionViewCell {
    
    static let identifier = "OnboardingCell"
    var onboardingViewModel: OnboardingCellViewModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViewCode()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    lazy var onboardingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    lazy var onboardingPrimaryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    lazy var onboardingSecondaryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    func setUpCell(data: OnboardingDataModel) {
        onboardingViewModel = OnboardingCellViewModel(objc: data)
        self.onboardingPrimaryLabel.text = onboardingViewModel?.primaryLabel
        self.onboardingSecondaryLabel.text = onboardingViewModel?.secondaryLabel
        self.onboardingImageView.image = UIImage(named: onboardingViewModel?.imageString ?? "")
    }
}

extension OnboardingCell: ViewCode {
    
    func configureSubViews() {
        self.contentView.addSubview(self.onboardingImageView)
        self.contentView.addSubview(self.onboardingPrimaryLabel)
        self.contentView.addSubview(self.onboardingSecondaryLabel)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            
            self.onboardingImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 24),
            self.onboardingImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.onboardingImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.onboardingImageView.heightAnchor.constraint(equalToConstant: 250),
            
            self.onboardingPrimaryLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            self.onboardingPrimaryLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            self.onboardingPrimaryLabel.topAnchor.constraint(equalTo: self.onboardingImageView.bottomAnchor, constant: 50),
            
            self.onboardingSecondaryLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            self.onboardingSecondaryLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            self.onboardingSecondaryLabel.topAnchor.constraint(equalTo: self.onboardingPrimaryLabel.bottomAnchor, constant: 12),
            
        ])
    }
    
    func configureAdditionalBehaviors() { }
    
    func configureAccessibility() { }
}
