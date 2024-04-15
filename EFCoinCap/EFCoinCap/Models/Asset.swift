//
//  Assets.swift
//  EFCoinCap
//
//  Created by efulgencio on 13/4/24.
//

import Foundation


public struct Asset: Decodable, Hashable {
    let id: String?
    let rank: String?
    let symbol: String?
    let name: String?
    let supply: String?
    let maxSupply: String?
    let marketCapUsd: String?
    let volumeUsd24Hr: String?
    var priceUsd: String?
    let changePercent24Hr: String?
    let vwap24Hr: String?
}

extension Asset {
    static let Mock = Asset(
        id: "bitcoin",
        rank: "1",
        symbol: "BTC",
        name: "Bitcoin",
        supply: "17193925.0000000000000000",
        maxSupply: "21000000.0000000000000000",
        marketCapUsd: "119150835874.4699281625807300",
        volumeUsd24Hr: "2927959461.1750323310959460",
        priceUsd: "6929.8217756835584756",
        changePercent24Hr: "-0.8101417214350335",
        vwap24Hr: "7175.0663247679233209"
    )
}

public struct Assets: Decodable {
    public var data: [Asset]
    public init() { self.data = [Asset]() }
}

public struct AssetsDTO: Decodable{
    public var data: [Asset]
    public init() { self.data = [Asset]() }
}

public struct AssetId: Decodable {
    public var data: Asset?
    public var timestamp: Int
    public init() {
        self.data = nil
        self.timestamp = 0
    }
}

let jsonAssets = """
{
  "data": [
        {
          "id": "bitcoin",
          "rank": "1",
          "symbol": "BTC"
        },
        {
          "id": "ethereum",
          "rank": "2",
          "symbol": "ETH"
        }
    ]
}
""".data(using: .utf8)!


let jsonAssetsId = """
{
  "data": {
    "id": "bitcoin",
    "rank": "1",
    "symbol": "BTC",
    "name": "Bitcoin",
    "supply": "17193925.0000000000000000",
    "maxSupply": "21000000.0000000000000000",
    "marketCapUsd": "119179791817.6740161068269075",
    "volumeUsd24Hr": "2928356777.6066665425687196",
    "priceUsd": "6931.5058555666618359",
    "changePercent24Hr": "-0.8101417214350335",
    "vwap24Hr": "7175.0663247679233209"
  },
  "timestamp": 1533581098863
}
""".data(using: .utf8)!


