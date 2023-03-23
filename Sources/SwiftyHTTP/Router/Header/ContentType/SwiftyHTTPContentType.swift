//
//  SwiftyHTTPContentType.swift
//  
//
//  Created by Antonio Guerra on 23/03/23.
//

import Foundation

enum SwiftyHTTPContentType: ValueRepresentable {
    case application(SwiftyHTTPApplicationContentTypeValue)
    case audio(SwiftyHTTPAudioContentTypeValue)
    
    var value: String {
        switch self {
        case .application(let swiftyHTTPApplicationContentTypeValue):
            return "application/\(swiftyHTTPApplicationContentTypeValue.rawValue)"
        case .audio(let swiftyHTTPAudioContentTypeValue):
            return "audio/\(swiftyHTTPAudioContentTypeValue.rawValue)"
        }
    }
}
