//
//  ViewController.swift
//  MTMTecnologia-TesteTecnico
//
//  Created by Henrique Marques on 03/08/23.
//

import UIKit
import SkeletonView

class HomeController: UIViewController {
    
    var homeView: HomeView?
    var homeViewModel: HomeViewModel?
    var alertView: Alerts?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.homeView = HomeView()
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeViewModel = HomeViewModel(service: HomeService())
        self.homeView?.homeCollectionViewProtocols(delegate: self, dataSource: self)
        self.homeView?.delegate(delegate: self)
        self.homeViewModel?.delegate(delegate: self)
        self.alertView = Alerts(controller: self)
        self.showSkeleton()
        self.homeViewModel?.getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.configNavigationAppearanceController()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configNavigationAppearanceController() {
        self.title = "Home"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .secondarySystemBackground
        appearance.titleTextAttributes = [.foregroundColor: UIColor.label]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.label]
        navigationController?.navigationBar.tintColor = .label
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    func showSkeleton() {
        let animation = SkeletonAnimationBuilder().makeSlidingAnimation(withDirection: .topBottom)
        self.homeView?.homeCollectionView.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: .midnightBlue), animation: animation)
    }
}

extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, SkeletonCollectionViewDataSource {
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> SkeletonView.ReusableCellIdentifier {
        return HomeCell.identifier
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeViewModel?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.identifier, for: indexPath) as? HomeCell else {return UICollectionViewCell()}
        guard let data = homeViewModel?.indexPath(indexPath: indexPath) else {return.init()}
        cell.prepareCell(data: data)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let data = homeViewModel?.indexPath(indexPath: indexPath) else {return}
        let characterController = CharacterController(viewModel: CharacterViewModel(characterData: data))
        self.navigationController?.pushViewController(characterController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 30, height: 300)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height - 1000
        let height = scrollView.frame.size.height
        if offsetY > contentHeight - height {
            self.homeViewModel?.getMoreData(nextPage: homeViewModel?.nextPageToLoad ?? "")
        }
    }
}

extension HomeController: HomeScreenProtocol {
    
    func pullToRefreshAction() {
        DispatchQueue.main.async {
            self.homeViewModel?.reloadData()
            self.homeView?.pullToRefresh.endRefreshing()
        }
    }
}

extension HomeController: HomeControllerViewModelProtocol {
    
    func success() {
        DispatchQueue.main.async {
            self.homeView?.stopSkeletonAnimation()
            self.homeView?.hideSkeleton()
            self.homeView?.homeCollectionView.reloadData()
        }
    }
    
    func failure(error: String) {
        alertView?.getAlert(title: "Error occurred", message: "\(error)", buttonMessage: "Cancel")
    }
}
