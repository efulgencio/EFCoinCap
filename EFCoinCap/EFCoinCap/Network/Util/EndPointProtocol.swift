//
//  EndPointProtocol.swift
//  EFCoinCap
//
//  Created by efulgencio on 12/4/24.
//

import Foundation

public protocol EndPointProtocol {
    var headers: [String: String] { get }
    var method: String { get }
    var urlString: String { get }
    var parameters: [String: Any] { get }
}

public enum URLRequestMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}
