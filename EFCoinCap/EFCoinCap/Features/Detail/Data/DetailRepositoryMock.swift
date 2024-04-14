//
//  DetailRepositoryMock.swift
//  EFCoinCap
//
//  Created by efulgencio on 14/4/24.
//

import Foundation
import Combine

extension DetailRepository {
    public static let mock = Self(
        getAssetId: { id in
            let jsonAssets = try! JSONDecoder().decode(AssetId.self, from: jsonAssets)
            return Just(jsonAssets)
                .setFailureType(to: NetworkError.self)
                .eraseToAnyPublisher()
        },
        getHistories: { id in
            let jsonHistoriesMock = try! JSONDecoder().decode(HistoriesId.self, from: jsonHistory)
            return Just(jsonHistoriesMock)
                .setFailureType(to: NetworkError.self)
                .eraseToAnyPublisher()
        },
        getMarkets: {
            let jsonMarketsMock = try! JSONDecoder().decode(Markets.self, from: jsonMarkets)
            return Just(jsonMarketsMock)
                .setFailureType(to: NetworkError.self)
                .eraseToAnyPublisher()
        },
        getExchanges: {
            let jsonExchangesMock = try! JSONDecoder().decode(Exchanges.self, from: jsonExchanges)
            return Just(jsonExchangesMock)
                .setFailureType(to: NetworkError.self)
                .eraseToAnyPublisher()
        }
    )
}
