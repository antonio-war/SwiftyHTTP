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
    case javascript
    case octetStream = "octet-stream"
    case ogg
    case pdf
    case xhtmlXml = "xhtml+xml"
    case xShockwaveFlash = "x-shockwave-flash"
    case json
    case ldJson = "ld+json"
    case xml
    case zip
    case xWWWFormUrlencoded = "x-www-form-urlencoded"
}
