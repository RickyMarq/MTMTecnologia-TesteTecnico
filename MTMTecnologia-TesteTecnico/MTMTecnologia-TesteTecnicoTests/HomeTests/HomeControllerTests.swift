//
//  HomeControllerTests.swift
//  MTMTecnologia-TesteTecnicoTests
//
//  Created by Henrique Marques on 05/08/23.
//

import XCTest
import UIKit
@testable import MTMTecnologia_TesteTecnico

class ViewModelMock {
    var delegate: HomeControllerViewModelProtocol?
    
    func action() {
        delegate?.success()
    }
}

final class HomeControllerTests: XCTestCase {
    
    var homeController: HomeController!
    var collectionView: UICollectionView!
    var collectionViewMock: CollectionViewMock!
    var viewModelMock = ViewModelMock()
    
    override func setUpWithError() throws {
        homeController = HomeController()
        homeController.loadViewIfNeeded()
        continueAfterFailure = false
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        homeController.homeView?.homeCollectionView = collectionView
        homeController.homeView?.homeCollectionViewProtocols(delegate: homeController.self, dataSource: homeController.self)
        viewModelMock = ViewModelMock()
        viewModelMock.delegate = homeController
        collectionViewMock = CollectionViewMock(frame: .zero, collectionViewLayout: UICollectionViewLayout.init())
    }
    
    override func tearDownWithError() throws {
        homeController = nil
        collectionView = nil
        collectionViewMock = nil
    }
    
    func testConfigCollection() throws {
        XCTAssertTrue(homeController.homeView?.homeCollectionView.delegate is HomeControllerViewModelProtocol)
        XCTAssertTrue(homeController.homeView?.homeCollectionView.dataSource is HomeControllerViewModelProtocol)
    }
    
    func testNumberOfItemsInSection() {
        collectionViewMock.dataSource = homeController
        collectionViewMock.delegate = homeController
        XCTAssertEqual(collectionViewMock.numberOfRows, 0)
        _ = collectionViewMock.numberOfItems(inSection: 0)
        XCTAssertEqual(collectionViewMock.numberOfRows, 1)
    }
    
    func testCellForItemAtIndexPath() {
        collectionViewMock.dataSource = homeController
        XCTAssertEqual(collectionViewMock.cellForItem, 0)
        _ = collectionViewMock.cellForItem(at: IndexPath(row: 0, section: 0))
        XCTAssertEqual(collectionViewMock.cellForItem, 1)
    }
}

class CollectionViewMock: UICollectionView {
    var numberOfRows = 0
    var cellForItem = 0
    
    override func numberOfItems(inSection section: Int) -> Int {
        numberOfRows += 1
        return super.numberOfItems(inSection: section)
    }
    
    override func cellForItem(at indexPath: IndexPath) -> UICollectionViewCell? {
        cellForItem += 1
        return super.cellForItem(at: indexPath)
    }
}
