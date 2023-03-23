//
//  SwiftyHTTPApplicationContentTypeValue.swift
//  
//
//  Created by Antonio Guerra on 23/03/23.
//

import Foundation

enum SwiftyHTTPApplicationContentTypeValue: String, SwiftyHTTPContentTypeValue {
    case ediX12 = "EDI-X12"
    case edifact = "EDIFACT"
    case javascript = "javascript"
    case octetStream = "octet-stream"
    case ogg = "ogg"
    case pdf = "pdf"
    case xhtmlXml = "xhtml+xml"
    case xShockwaveFlash = "x-shockwave-flash"
    case json = "json"
    case ldJson = "ld+json"
    case xml = "xml"
    case zip = "zip"
    case xWWWFormUrlencoded = "x-www-form-urlencoded"
}
