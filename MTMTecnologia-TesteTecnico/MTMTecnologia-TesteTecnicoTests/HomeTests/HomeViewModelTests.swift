//
//  HomeTests.swift
//  MTMTecnologia-TesteTecnicoTests
//
//  Created by Henrique Marques on 04/08/23.
//

import XCTest
@testable import MTMTecnologia_TesteTecnico

final class HomeViewModelTests: XCTestCase {
    
    var viewModel: HomeViewModel!
    var mockService: MockHomeService!
    var mockDelegate: MockHomeViewModelDelegate!
    
    override func setUpWithError() throws {
        mockService = MockHomeService()
        mockDelegate = MockHomeViewModelDelegate()
        self.viewModel = HomeViewModel(service: mockService)
        viewModel.delegate(delegate: mockDelegate)
    }
    
    override func tearDownWithError() throws {
        self.viewModel = nil
        self.mockService = nil
        self.mockDelegate = nil
        super.tearDown()
    }
    
    func testInicialization() {
        XCTAssertNotNil(viewModel, "ViewModel should not be nil")
        XCTAssertNil(viewModel.nextPage, "nextPage should be nil initially")
        XCTAssertNotNil(viewModel.service, "Service should be initialized")
    }
    
    func testSuccess() {
        let mockData = ResultData(id: 0, name: "", status: "", species: "", type: "", gender: "", origin: Origin(name: ""), location: Location(name: ""), image: "", episode: [""], url: "", created: "")
        mockService.result = .success(HomeModel(info: Info(count: 0, pages: 0, next: ""), results: [mockData]))
        viewModel.getData()
        
        XCTAssertEqual(viewModel.homeObjc, HomeModel(info: Info(count: 0, pages: 0, next: ""), results: [mockData]), "homeObjc should be updated with mock data")
        XCTAssertTrue(mockDelegate.successCalled)
    }
    
    func testRequestFailure() {
        mockService.result = .failure(NSError(domain: "com.test.error", code: 0))
        viewModel.getData()
        XCTAssertEqual(viewModel.count, 0)
        XCTAssertTrue(mockDelegate.errorCalled)
    }
}

class MockHomeViewModelDelegate: HomeControllerViewModelProtocol {
    var successCalled = false
    var errorCalled = false
    
    func success() {
        successCalled = true
    }
    
    func failure(error: String) {
        errorCalled = true
    }
}

class MockHomeService: HomeServiceProtocol {
    var result: Result<HomeModel, Error> = .success(HomeModel.init(info: Info(count: 0, pages: 0, next: ""), results: []))
    
    func getCharacters(completion: @escaping (Result<HomeModel, Error>) -> Void) {
        completion(result)
    }
    
    func getMoreCharacters(nextPage: String, completion: @escaping (Result<MTMTecnologia_TesteTecnico.HomeModel, Error>) -> Void) {
        completion(result)
    }
}
