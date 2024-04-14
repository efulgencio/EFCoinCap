//
//  HistoryView.swift
//  EFCoinCap
//
//  Created by efulgencio on 14/4/24.
//

import SwiftUI

struct HistoryRow: View {
    let history: History
    
    var body: some View {
        HStack(spacing: 0) {
            leftColumn
            Spacer()
            rightColumn
        }
        .font(.subheadline)
    }
}

extension HistoryRow {
    
    private var leftColumn: some View {
        HStack(spacing: 0) {
            Text(history.priceUsd!.toDouble().asCurrencyWithDecimals())
                .font(.caption)
                .foregroundColor(Color.themeAsset.rank)
                .frame(minWidth: 30)
        }
    }
    
    private var rightColumn: some View {
        VStack(alignment: .trailing) {
            Text(history.time?.formatearFechaDesdeTimestamp() ?? "")
                .bold()
                .foregroundColor(Color.themeAsset.price)
        }
    }
}
