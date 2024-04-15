//
//  Color.swift
//  EFCoinCap
//
//  Created by efulgencio on 13/4/24.
//

import Foundation
import SwiftUI

extension Color {
    static let themeNumber = ColorThemeNumber()
    static let themeAsset = ColorThemeAsset()
    static let themeOption = ColorThemeOption()
}

struct ColorThemeAsset {
    let rank = Color("AssetRank")
    let symbol = Color("AssetSymbol")
    let price = Color("AssetPrice")
}

struct ColorThemeNumber {
    let green = Color("NumberGreen")
    let red = Color("NumberRed")
}

struct ColorThemeOption {
    let assetOption = Color("AssetOptionColor")
    let historyOption = Color("HistoryOptionColor")
    let unSelectedOption = Color("UnSelectedOptionColor")
}
