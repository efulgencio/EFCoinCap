//
//  Genre.swift
//  EFCoinCap
//
//  Created by efulgencio on 12/4/24.
//

import Foundation

public struct History: Decodable, Hashable {
    public var priceUsd: String?
    public var time: Int?
}

public struct HistoriesId: Decodable {
    public var data: [History]
    public var timestamp: Int
    public init() {
        self.data = [History]()
        self.timestamp = 0
    }
}


let jsonHistory = """
{
  "data": [
        {
          "priceUsd": "6379.3997635993342453",
          "time": 1530403200000
        },
        {
          "priceUsd": "6466.3135622762295280",
          "time": 1530489600000
        },
        {
          "priceUsd": "6601.0724971279524219",
          "time": 1530576000000
        }
    ],
    "timestamp": 1533581098863
}
""".data(using: .utf8)!
