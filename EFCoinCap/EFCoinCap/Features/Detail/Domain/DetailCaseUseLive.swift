//
//  DetailCaseUseLive.swift
//  EFCoinCap
//
//  Created by efulgencio on 14/4/24.
//

import Foundation
import Combine

extension DetailUseCase {
    public static let live = Self(
        getAssetId: { id in
            let detailRepository: DetailRepository = .live
            return detailRepository.getAssetId(id)
                    .eraseToAnyPublisher()
        },
        getHistories: { id in
            let detailRepository: DetailRepository = .live
            return detailRepository.getHistories(id)
                    .eraseToAnyPublisher()
        }, getMarkets: {
            let detailRepository: DetailRepository = .live
            return detailRepository.getMarkets()
                    .eraseToAnyPublisher()
        }, getExchanges: {
            let detailRepository: DetailRepository = .live
            return detailRepository.getExchanges()
                    .eraseToAnyPublisher()
        }
    )
}
