//
//  practice.swift
//  FreeMealTests
//
//  Created by 김창현 on 4/30/23.
//

import XCTest
@testable import FreeMeal

final class NetworkingTests: XCTestCase {

    var networking: Networking!

    override func setUpWithError() throws {
        networking = Networking()
    }

    override func tearDownWithError() throws {
        networking = nil
    }

    func testGetAllDessert() {
        let expectation = self.expectation(description: "getAllDessert")
        
        networking.getAllDessert { result in
            switch result {
            case .success(let desserts):
                XCTAssertFalse(desserts.isEmpty)
                expectation.fulfill()
            case .failure(let error):
                XCTFail("getAllDessert error: \(error)")
            }
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }

    func testGetDessertBy() {
        let expectation = self.expectation(description: "getDessertBy")

        let testDessertId = "52772"
        networking.getDessertBy(id: testDessertId) { result in
            switch result {
            case .success(let dessertDetail):
                XCTAssertEqual(dessertDetail.idMeal, testDessertId)
                expectation.fulfill()
            case .failure(let error):
                XCTFail("getDessertBy error: \(error)")
            }
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }

    func testBadURL() {
        let expectation = self.expectation(description: "badURL")
        
        let networking = Networking()
        let testDessertId = "invalid_id"
        
        networking.getDessertBy(id: testDessertId) { result in
            switch result {
            case .success(_):
                XCTFail("Expected badURL error")
            case .failure(let error):
                XCTAssertEqual(error, NetworkError.badURL)
                expectation.fulfill()
            }
        }

        waitForExpectations(timeout: 5, handler: nil)
    }

}
