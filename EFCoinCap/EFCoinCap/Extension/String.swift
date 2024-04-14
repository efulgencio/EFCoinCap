//
//  String.swift
//  EFCoinCap
//
//  Created by efulgencio on 13/4/24.
//

import Foundation

extension String {
    func toDouble() -> Double {
        return Double(self) ?? 0.0
    }
}
