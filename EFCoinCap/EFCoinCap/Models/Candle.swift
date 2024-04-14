//
//  Candle.swift
//  EFCoinCap
//
//  Created by efulgencio on 14/4/24.
//

import Foundation


public struct Candle: Decodable, Hashable {
    public var open: String?
    public var high: String?
    public var low: String?
    public var close: String?
    public var volume: String?
    public var period: String?

}

public struct Candles: Decodable {
    public var data: [History]
    public init() { self.data = [History]() }
}


let jsonCandles = """
{
  "data": [
{
  "open": "0.0708000000000000",
  "high": "0.0710450000000000",
  "low": "0.0706434000000000",
  "close": "0.0708350100000000",
  "volume": "1818.1433015300000000",
  "period": 1530720000000
},
{
  "open": "0.0708316700000000",
  "high": "0.0715192000000000",
  "low": "0.0706544100000000",
  "close": "0.0712472600000000",
  "volume": "1649.2534471200000000",
  "period": 1530748800000
}
    ]
}
""".data(using: .utf8)!



