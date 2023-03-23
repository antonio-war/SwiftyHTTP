//
//  SwiftyHTTPContentTypeHeaderValue.swift
//  
//
//  Created by Antonio Guerra on 23/03/23.
//

import Foundation

enum SwiftyHTTPContentTypeHeaderValue: SwiftyHTTPHeaderValue {
    case application(SwiftyHTTPApplicationContentTypeValue)
    case audio(SwiftyHTTPAudioContentTypeValue)
    case image(SwiftyHTTPImageContentTypeValue)
    case multipart(SwiftyHTTPMultipartContentTypeValue)
    case text(SwiftyHTTPTextContentTypeValue)
    case video(SwiftyHTTPVideoContentTypeValue)
    
    var value: String {
        switch self {
        case .application(let swiftyHTTPApplicationContentTypeValue):
            return "application/\(swiftyHTTPApplicationContentTypeValue.rawValue)"
        case .audio(let swiftyHTTPAudioContentTypeValue):
            return "audio/\(swiftyHTTPAudioContentTypeValue.rawValue)"
        case .image(let swiftyHTTPImageContentTypeValue):
            return "image/\(swiftyHTTPImageContentTypeValue.rawValue)"
        case .multipart(let swiftyHTTPMultipartContentTypeValue):
            return "multipart/\(swiftyHTTPMultipartContentTypeValue.rawValue)"
        case .text(let swiftyHTTPTextContentTypeValue):
            return "text/\(swiftyHTTPTextContentTypeValue.rawValue)"
        case .video(let swiftyHTTPVideoContentTypeValue):
            return "video/\(swiftyHTTPVideoContentTypeValue.rawValue)"
        }
    }
}
