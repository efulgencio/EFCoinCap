//
//  Market.swift
//  EFCoinCap
//
//  Created by efulgencio on 14/4/24.
//

import Foundation

public struct Market: Decodable, Hashable {
    public var exchangeId: String?
    public var baseId: String?
    public var quoteId: String?
    public var baseSymbol: String?
    public var quoteSymbol: String?
    public var volumeUsd24Hr: String?
    public var priceUsd: String?
    public var volumePercent: String?
}

public struct Markets: Decodable {
    public var data: [History]
    public init() { self.data = [History]() }
}


let jsonMarkets = """
{
  "data": [
        {
          "exchangeId": "bitstamp",
          "rank": "1",
          "baseSymbol": "BTC",
          "baseId": "bitcoin",
          "quoteSymbol": "USD",
          "quoteId": "united-states-dollar",
          "priceQuote": "6927.3300000000000000",
          "priceUsd": "6927.3300000000000000",
          "volumeUsd24Hr": "43341291.9576547008000000",
          "percentExchangeVolume": "67.2199253376108585",
          "tradesCount24Hr": "420721",
          "updated": 1533581033590
        },
        {
          "exchangeId": "zb",
          "rank": "1",
          "baseSymbol": "DASH",
          "baseId": "dash",
          "quoteSymbol": "USDT",
          "quoteId": "tether",
          "priceQuote": "202.4500000000000000",
          "priceUsd": "202.5669129702824173",
          "volumeUsd24Hr": "152784724.1478030952209944",
          "percentExchangeVolume": "34.0281942707190045",
          "tradesCount24Hr": null,
          "updated": 1533581013747
        }
    ]
}
""".data(using: .utf8)!


