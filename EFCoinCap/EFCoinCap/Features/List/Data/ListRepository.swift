//
//  ListRepository.swift
//  EFCoinCap
//
//  Created by efulgencio on 12/4/24.
//

import Foundation
import Combine

public struct ListRepository {
    public var getAssets: () -> AnyPublisher<AssetsDTO, NetworkError>

    public init(getAssets: @escaping () -> AnyPublisher<AssetsDTO, NetworkError>) {
        self.getAssets = getAssets
    }
}


