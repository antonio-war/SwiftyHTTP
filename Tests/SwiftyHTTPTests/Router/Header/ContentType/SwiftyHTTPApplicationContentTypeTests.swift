//
//  SwiftyHTTPApplicationContentTypeTests.swift
//  
//
//  Created by Antonio Guerra on 23/03/23.
//

import XCTest
@testable import SwiftyHTTP

final class SwiftyHTTPApplicationContentTypeTests: XCTestCase {
    
    private var contentType: SwiftyHTTPContentType!

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        contentType = nil
    }

    func testEdiX12() {
        contentType = .application(.ediX12)
        XCTAssertEqual(contentType.value, "application/EDI-X12")
    }
    
    func testEdifact() {
        contentType = .application(.edifact)
        XCTAssertEqual(contentType.value, "application/EDIFACT")
    }
    
    func testJavascript() {
        contentType = .application(.javascript)
        XCTAssertEqual(contentType.value, "application/javascript")
    }
    
    func testOctetStream() {
        contentType = .application(.octetStream)
        XCTAssertEqual(contentType.value, "application/octet-stream")
    }
    
    func testOgg() {
        contentType = .application(.ogg)
        XCTAssertEqual(contentType.value, "application/ogg")
    }
    
    func testPdf() {
        contentType = .application(.pdf)
        XCTAssertEqual(contentType.value, "application/pdf")
    }
    
    func testXhtmlXml() {
        contentType = .application(.xhtmlXml)
        XCTAssertEqual(contentType.value, "application/xhtml+xml")
    }
    
    func testXShockwaveFlash() {
        contentType = .application(.xShockwaveFlash)
        XCTAssertEqual(contentType.value, "application/x-shockwave-flash")
    }
    
    func testJson() {
        contentType = .application(.json)
        XCTAssertEqual(contentType.value, "application/json")
    }
    
    func testLdJson() {
        contentType = .application(.ldJson)
        XCTAssertEqual(contentType.value, "application/ld+json")
    }
    
    func testXml() {
        contentType = .application(.xml)
        XCTAssertEqual(contentType.value, "application/xml")
    }
    
    func testZip() {
        contentType = .application(.zip)
        XCTAssertEqual(contentType.value, "application/zip")
    }
    
    func testUrlEncoded() {
        contentType = .application(.xWWWFormUrlencoded)
        XCTAssertEqual(contentType.value, "application/x-www-form-urlencoded")
    }
}
