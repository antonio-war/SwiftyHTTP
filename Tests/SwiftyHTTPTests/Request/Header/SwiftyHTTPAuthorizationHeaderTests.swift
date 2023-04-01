//
//  SwiftyHTTPAuthorizationHeaderTests.swift
//  
//
//  Created by Antonio Guerra on 01/04/23.
//

import XCTest
@testable import SwiftyHTTP

final class SwiftyHTTPAuthorizationHeaderTests: XCTestCase {

    private var authorization: SwiftyHTTPAuthorizationHeaderValue!
    
    override func tearDownWithError() throws {
        authorization = nil
    }

    func testBasicCredentials() {
        authorization = .basic("NOT NULL")
        XCTAssertEqual(authorization.value, "Basic NOT NULL")
        
        authorization = .basic("")
        XCTAssertEqual(authorization.value, "Basic NULL")
    }
    
    func testBearerToken() {
        authorization = .bearer("NOT NULL")
        XCTAssertEqual(authorization.value, "Bearer NOT NULL")
        
        authorization = .bearer("")
        XCTAssertEqual(authorization.value, "Bearer NULL")
    }
}
