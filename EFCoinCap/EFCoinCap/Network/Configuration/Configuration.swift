//
//  Configuration.swift
//  EFCoinCap
//
//  Created by efulgencio on 12/4/24.
//

import Foundation

public class ConfigurationNet {
    public static let shared = ConfigurationNet()
    public var data: Config = Config(baseUrl: "https://api.coincap.io/v2/")
    
    private init() {}
}
