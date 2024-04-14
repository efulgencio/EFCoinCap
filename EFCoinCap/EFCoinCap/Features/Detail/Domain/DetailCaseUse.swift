//
//  DetailCaseUse.swift
//  EFCoinCap
//
//  Created by efulgencio on 14/4/24.
//

import Foundation
import Combine

public struct DetailUseCase {
    public var getAssetId: (String) -> AnyPublisher<AssetId, NetworkError>
    public var getHistories: (String) -> AnyPublisher<HistoriesId, NetworkError>
    public var getMarkets: () -> AnyPublisher<Markets, NetworkError>
    public var getExchanges: () -> AnyPublisher<Exchanges, NetworkError>
    
    init(
            getAssetId: @escaping (String) -> AnyPublisher<AssetId, NetworkError>,
            getHistories: @escaping (String) -> AnyPublisher<HistoriesId, NetworkError>,
            getMarkets: @escaping () -> AnyPublisher<Markets, NetworkError>,
            getExchanges: @escaping () -> AnyPublisher<Exchanges, NetworkError>
        )
    {
        self.getAssetId = getAssetId
        self.getHistories = getHistories
        self.getMarkets = getMarkets
        self.getExchanges = getExchanges
        
    }
}
