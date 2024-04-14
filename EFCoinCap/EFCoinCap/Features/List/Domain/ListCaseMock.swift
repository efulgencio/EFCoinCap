//
//  ListCaseMock.swift
//  EFCoinCap
//
//  Created by efulgencio on 12/4/24.
//

import Foundation
import Combine

extension ListUseCase {
    public static let mock = Self(
        getAssets: {
            let listRepository: ListRepository = .mock
            let assets =  try! JSONDecoder().decode(AssetsDTO.self, from: jsonAssets)
            return Just(ListMapper().mapValue(response: assets))
                .setFailureType(to: NetworkError.self)
                .eraseToAnyPublisher()
        }
    )
}
