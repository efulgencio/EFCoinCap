//
//  ListRespositoryLive.swift
//  EFCoinCap
//
//  Created by efulgencio on 12/4/24.
//

import Foundation
import Combine

extension ListRepository {
    public static let live = Self(
        getAssets: {
            return CombineManager.shared.getData(endpoint: EndPointGrupo.enumAsset(.assets), type: AssetsDTO.self)
        }
    )
}


