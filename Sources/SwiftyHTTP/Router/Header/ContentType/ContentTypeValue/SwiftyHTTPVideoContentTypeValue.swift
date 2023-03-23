//
//  SwiftyHTTPVideoContentTypeValue.swift
//  
//
//  Created by Antonio Guerra on 23/03/23.
//

import Foundation

enum SwiftyHTTPVideoContentTypeValue: String, SwiftyHTTPContentTypeValue {
    case mpeg
    case mp4
    case quicktime
    case xMsWmv = "x-ms-wmv"
    case xMsvideo = "x-msvideo"
    case xFlv = "x-flv"
    case wbm
}
