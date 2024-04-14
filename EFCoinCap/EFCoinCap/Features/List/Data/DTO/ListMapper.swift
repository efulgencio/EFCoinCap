//
//  ListMapper.swift
//  EFCoinCap
//
//  Created by efulgencio on 14/4/24.
//

import Foundation


public class ListMapper: Mapper<AssetsDTO, Assets> {
    public override func mapValue(response: AssetsDTO) -> Assets {
        var assetsFormatted = Assets()
        for i in 0..<response.data.count {
            var assetFormated: Asset = response.data[i]
            assetFormated.priceUsd = assetFormated.priceUsd!.toDouble().asCurrencyWithDecimals()
            assetsFormatted.data.append(assetFormated)
        }
        return assetsFormatted
    }
}
