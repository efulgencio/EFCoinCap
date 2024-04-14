//
//  ListCaseLive.swift
//  EFCoinCap
//
//  Created by efulgencio on 12/4/24.
//

import Foundation
import Combine

extension ListUseCase {
    public static let live = Self(
        getAssets: {
            let listRepository: ListRepository = .live
            return listRepository.getAssets()
                .map { assetDto in
                    return ListMapper().mapValue(response: assetDto)
                }
                .eraseToAnyPublisher()
        }
    )
}
