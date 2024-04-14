//
//  DetailUseMock.swift
//  EFCoinCap
//
//  Created by efulgencio on 14/4/24.
//

import Foundation
import Combine

extension DetailUseCase {
    public static let mock = Self(
        getAssetId: { id in
            let detailRepository: DetailRepository = .mock
            return detailRepository.getAssetId(id)
                    .eraseToAnyPublisher()
        },
        getHistories: { id in
            let detailRepository: DetailRepository = .mock
            return detailRepository.getHistories(id)
                    .eraseToAnyPublisher()
        }, getMarkets: {
            let detailRepository: DetailRepository = .mock
            return detailRepository.getMarkets()
                    .eraseToAnyPublisher()
        }, getExchanges: {
            let detailRepository: DetailRepository = .mock
            return detailRepository.getExchanges()
                    .eraseToAnyPublisher()
        }
    )
}
