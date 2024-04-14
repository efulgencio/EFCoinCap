//
//  ListCaseUse.swift
//  EFCoinCap
//
//  Created by efulgencio on 12/4/24.
//

import Foundation
import Combine

public struct ListUseCase {
    public var getAssets: () -> AnyPublisher<Assets, NetworkError>
    
    init(getAssets: @escaping () -> AnyPublisher<Assets, NetworkError>)
    {
        self.getAssets = getAssets
    }
}
