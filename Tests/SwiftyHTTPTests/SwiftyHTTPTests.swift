//
//  SwiftyHTTPTests.swift
//  
//
//  Created by Antonio Guerra on 27/03/23.
//

import XCTest
@testable import SwiftyHTTP

final class SwiftyHTTPTests: XCTestCase {

    enum CatRouter: SwiftyHTTPRouter {
        case test
        
        var baseURL: URL? {
            URL(string: "https://meowfacts.herokuapp.com")
        }
        
        var path: String {
            return "/"
        }
        
        var method: SwiftyHTTPMethod {
            .get
        }
        
        var headers: [SwiftyHTTPHeader] {
            []
        }
        
        var parameters: [SwiftyHTTPQueryParameter] {
            []
        }
        
        var body: SwiftyHTTPBody? {
            return nil
        }
    }
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func testDefaultRequest() {
        let expectation = expectation(description: "DefaultRequest")
        SwiftyHTTP.request(with: CatRouter.test, log: true) { result in
            expectation.fulfill()
        }
        waitForExpectations(timeout: 30, handler: nil)
    }
}
