//
//  SwiftyHTTPRouter.swift
//  
//
//  Created by Antonio Guerra on 23/03/23.
//

import Foundation

protocol HTTPRouter {
    var baseURL: URL { get throws }
    var path: String { get }
    var method: SwiftyHTTPMethod { get }
    var headers: []
    var body: SwiftyHTTPBody? { get }
}
