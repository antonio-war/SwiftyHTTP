//
//  SwiftyHTTPRouterTests.swift
//  
//
//  Created by Antonio Guerra on 23/03/23.
//

import XCTest
@testable import SwiftyHTTP

final class SwiftyHTTPRouterTests: XCTestCase {
    
    enum TestRouter: SwiftyHTTPRequest {
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
        
        var body: SwiftyHTTPRequestBody? {
            "Hello World"
        }
        
        var timeout: TimeInterval {
            return 15
        }
        
        var cachePolicy: URLRequest.CachePolicy {
            return .returnCacheDataElseLoad
        }
    }

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
        if #available(iOS 16.0, *) {
            let host = request.url?.host()
            XCTAssertNotNil(host)
            XCTAssertEqual(host!, "example.com")
        }
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
        if #available(iOS 16.0, *) {
            let includeParameter = request.url?.query()
            XCTAssertNotNil(includeParameter)
            XCTAssertEqual(includeParameter, "include=author")
        }
    }
    
    func testBody() throws {
        let body = request.httpBody
        XCTAssertNotNil(body)
        
        let decoded = try JSONDecoder().decode(String.self, from: body!)
        XCTAssertEqual(decoded, "Hello World")
    }
    
    func testTimeout() throws {
        let timeout = request.timeoutInterval
        XCTAssertEqual(timeout, 15)
    }
    
    func testCachePolicy() throws {
        let cachePolicy = request.cachePolicy
        XCTAssertEqual(cachePolicy, .returnCacheDataElseLoad)
    }
}
