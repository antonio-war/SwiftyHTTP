//
//  SwiftyHTTPMultipartContentType.swift
//  
//
//  Created by Antonio Guerra on 23/03/23.
//

import Foundation

public enum SwiftyHTTPMultipartContentTypeValue: String, SwiftyHTTPContentTypeValue {
    case mixed
    case alternative
    case related
    case formData = "form-data"
}
