//
//  HomeScreen.swift
//  MTMTecnologia-TesteTecnico
//
//  Created by Henrique Marques on 03/08/23.
//

import UIKit
import SkeletonView

protocol HomeScreenProtocol: AnyObject {
    func pullToRefreshAction()
}

class HomeView: UIView {
    
    weak var delegate: HomeScreenProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViewCode()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func delegate(delegate: HomeScreenProtocol) {
        self.delegate = delegate
    }
    
    lazy var homeCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(HomeCell.self, forCellWithReuseIdentifier: HomeCell.identifier)
        collectionView.isSkeletonable = true
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        collectionView.refreshControl = self.pullToRefresh
        return collectionView
    }()
    
    lazy var pullToRefresh: UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.translatesAutoresizingMaskIntoConstraints = false
        refresh.addTarget(self, action: #selector(pullToRefreshTriggered), for: .valueChanged)
        return refresh
    }()
    
    func homeCollectionViewProtocols(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        self.homeCollectionView.delegate = delegate
        self.homeCollectionView.dataSource = dataSource
    }
    
    @objc func pullToRefreshTriggered() {
        self.delegate?.pullToRefreshAction()
    }
}

extension HomeView: ViewCode {
    
    func configureSubViews() {
        self.addSubview(self.homeCollectionView)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            
            self.homeCollectionView.topAnchor.constraint(equalTo: self.topAnchor),
            self.homeCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.homeCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.homeCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
        ])
    }
    
    func configureAdditionalBehaviors() { }
    
    func configureAccessibility() { }
}
