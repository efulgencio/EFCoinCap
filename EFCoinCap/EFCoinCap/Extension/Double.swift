//
//  Double.swift
//  EFCoinCap
//
//  Created by efulgencio on 13/4/24.
//

import Foundation

extension Double {
    
    func asPercentString() -> String {
        return asNumberString() + "%"
    }

    func asCurrencyWithDecimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter.string(from: number) ?? "$0.00"
    }

    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency

        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
}
