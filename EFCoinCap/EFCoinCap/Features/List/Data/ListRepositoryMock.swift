//
//  ListRepositoryMock.swift
//  EFCoinCap
//
//  Created by efulgencio on 12/4/24.
//

import Foundation
import Combine

extension ListRepository {
    public static let mock = Self(
        getAssets: {
            let jsonAssetsMock = try! JSONDecoder().decode(AssetsDTO.self, from: jsonAssets)
            return Just(jsonAssetsMock)
                .setFailureType(to: NetworkError.self)
                .eraseToAnyPublisher()
        }
    )
}

