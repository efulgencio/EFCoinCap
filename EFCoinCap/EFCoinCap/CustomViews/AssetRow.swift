//
//  AssetRow.swift
//  EFCoinCap
//
//  Created by efulgencio on 13/4/24.
//

import SwiftUI

struct AssetRow: View {
    let asset: Asset
    
    var body: some View {
        HStack(spacing: 0) {
            leftColumn
            Spacer()
            rightColumn
        }
        .font(.subheadline)
    }
}


#Preview {
    AssetRow(asset: Asset.Mock)
        .previewLayout(.sizeThatFits)
}

extension AssetRow {
    
    private var leftColumn: some View {
        HStack(spacing: 0) {
            Text(asset.rank!)
                .font(.caption)
                .foregroundColor(Color.themeAsset.rank)
                .frame(minWidth: 30)
            Text(asset.symbol!.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundColor(Color.themeAsset.symbol)
        }
    }
    
    private var rightColumn: some View {
        VStack(alignment: .trailing) {
            Text(asset.priceUsd ?? "")
                .bold()
                .foregroundColor(Color.themeAsset.price)
            Text(asset.changePercent24Hr?.toDouble().asPercentString() ?? "")
                .foregroundColor(
                    (asset.changePercent24Hr?.toDouble() ?? 0 >= 0)
                    ? Color.themeNumber.green : Color.themeNumber.red)
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
}
