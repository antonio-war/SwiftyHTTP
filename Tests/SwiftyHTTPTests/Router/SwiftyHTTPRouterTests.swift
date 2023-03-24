//
//  SwiftyHTTPRouterTests.swift
//  
//
//  Created by Antonio Guerra on 23/03/23.
//

import XCTest
@testable import SwiftyHTTP

enum TestRouter: SwiftyHTTPRouter {
    case articles
    
    var baseURL: URL? {
        URL(string: "http://example.com")
    }
    
    var path: String {
        switch self {
        case .articles:
            return "articles"
        }
    }
    
    var method: SwiftyHTTPMethod {
        return .get
    }
    
    var headers: [SwiftyHTTPHeader] {
        return [
            .accept(.anything),
            .contentType(.application(.json)),
        ]
    }
    
    var parameters: [SwiftyHTTPQueryParameter] {
        return [
            .init(key: "include", value: "author")
        ]
    }
    
    var body: SwiftyHTTPBody? {
        return nil
    }
}

final class SwiftyHTTPRouterTests: XCTestCase {

    private var request: URLRequest!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        request = try TestRouter.articles.request
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        request = nil
    }
    
    func testHost() throws {
        let host = request.url?.host()
        XCTAssertNotNil(host)
        XCTAssertEqual(host!, "example.com")
    }
    
    func testPath() throws {
        let path = request.url?.relativePath
        XCTAssertNotNil(path)
        XCTAssertEqual(path!, "/articles")
    }
    
    func testMethod() throws {
        let method = request.httpMethod
        XCTAssertNotNil(method)
        XCTAssertEqual(method, "GET")
    }
    
    func testHeaders() throws {
        let acceptHeader = request.value(forHTTPHeaderField: "Accept")
        XCTAssertNotNil(acceptHeader)
        XCTAssertEqual(acceptHeader, "*/*")
        
        let contentType = request.value(forHTTPHeaderField: "Content-Type")
        XCTAssertNotNil(contentType)
        XCTAssertEqual(contentType, "application/json")
    }
    
    func testParameters() throws {
        let includeParameter = request.url?.query()
        XCTAssertNotNil(includeParameter)
        XCTAssertEqual(includeParameter, "include=author")
    }
}
