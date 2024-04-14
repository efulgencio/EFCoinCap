//
//  DetailRepositoryLive.swift
//  EFCoinCap
//
//  Created by efulgencio on 14/4/24.
//

import Foundation
import Combine

extension DetailRepository {
    public static let live = Self(
        getAssetId: { id in
            return CombineManager.shared.getData(endpoint: EndPointGrupo.enumAsset(.assetsId), type: AssetId.self, idAsset: id)
        },
        getHistories: { id in
            return CombineManager.shared.getData(endpoint: EndPointGrupo.enumAsset(.assetHistory), type: HistoriesId.self, idAsset: id)
        },
        getMarkets: {
            return CombineManager.shared.getData(endpoint: EndPointGrupo.enumAsset(.assetMarket), type: Markets.self)
        },
        getExchanges: {
            return CombineManager.shared.getData(endpoint: EndPointGrupo.enumExchange(.exchangesId), type: Exchanges.self)
        }
    )
}
