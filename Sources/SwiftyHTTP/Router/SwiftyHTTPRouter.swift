//
//  SwiftyHTTPRouter.swift
//  
//
//  Created by Antonio Guerra on 23/03/23.
//

import Foundation

protocol HTTPRouter {
    var endpoint: URL { get throws }
    var path: String { get }
    var method: SwiftyHTTPMethod { get }
    var headers: [SwiftyHTTPHeader] { get }
    var body: SwiftyHTTPBody? { get }
    var request: URLRequest { get throws }
}
