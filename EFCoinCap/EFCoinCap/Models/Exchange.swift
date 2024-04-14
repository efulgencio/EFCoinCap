//
//  Exchange.swift
//  EFCoinCap
//
//  Created by efulgencio on 14/4/24.
//

import Foundation


public struct Exchange: Decodable, Hashable {
    public var id: String?
    public var name: String?
    public var rank: String?
    public var percentTotalVolume: String?
    public var volumeUsd: String?
    public var tradingPairs: String?
    public var socket: String?
    public var exchangeUrl: String?
    public var updated: String?
}

public struct Exchanges: Decodable {
    public var data: [History]
    public init() { self.data = [History]() }
}


let jsonExchanges = """
{
  "data": [
        {
            "id": "okex",
            "name": "Okex",
            "rank": "1",
            "percentTotalVolume": "21.379485735166293542000000000000000000",
            "volumeUsd": "616465445.1646260280799955",
            "tradingPairs": "22",
            "socket": false,
            "exchangeUrl": "https://www.okex.com/",
            "updated": 1536343139514
        },
        {
            "id": "bithumb",
            "name": "Bithumb",
            "rank": "2",
            "percentTotalVolume": "15.172929246645476514000000000000000000",
            "volumeUsd": "437502880.0201364436175560",
            "tradingPairs": "42",
            "socket": false,
            "exchangeUrl": "https://www.bithumb.com/",
            "updated": 1536343090523
        }
    ]
}
""".data(using: .utf8)!


