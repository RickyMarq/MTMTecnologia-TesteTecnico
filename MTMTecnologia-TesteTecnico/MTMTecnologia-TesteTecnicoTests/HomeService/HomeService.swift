//
//  HomeService.swift
//  MTMTecnologia-TesteTecnicoTests
//
//  Created by Henrique Marques on 04/08/23.
//

import XCTest
@testable import MTMTecnologia_TesteTecnico

final class WebServicesTests: XCTestCase {
    var webService: HomeService!
    var nextPage: String!
    
    override func setUpWithError() throws {
        self.webService = HomeService()
        self.nextPage = "https://rickandmortyapi.com/api/character?page=2"
    }
    
    override func tearDownWithError() throws {
        self.webService = nil
        self.nextPage = nil
    }
    
    func testGetCharactersSuccess() throws {
        let expectation = self.expectation(description: "GetcharacterData")
        webService.getCharacters { result in
            switch result {
            case .success(let data):
                print(data)
                XCTAssertNotNil(data, "Sucesso, não pode ser nil.")
                XCTAssertGreaterThan(data.results.count, 0, "Personagem deve ser maior do que 0")
                expectation.fulfill()
            case .failure(_):
                XCTFail("A request não pode cair no caso de failure")
            }
        }
        waitForExpectations(timeout: 10)
    }
    
    func testGetMoreCharacters() throws {
        let expectation = self.expectation(description: "GetcharacterData")
        webService.getMoreCharacters(nextPage: nextPage) { result in
            switch result {
            case .success(let data):
                print(data)
                XCTAssertNotNil(data, "Sucesso, não pode ser nil.")
                XCTAssertGreaterThan(data.results.count, 0, "Personagem deve ser maior do que 0")
                expectation.fulfill()
            case .failure(_):
                XCTFail("O request não pode cair no caso de failure")
            }
        }
        waitForExpectations(timeout: 10)
    }
}
