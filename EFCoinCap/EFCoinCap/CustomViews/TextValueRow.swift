//
//  DetailRow.swift
//  EFCoinCap
//
//  Created by efulgencio on 15/4/24.
//

import SwiftUI

struct TextValueRow: View {
    
    let textItem: String
    let valueItem: String
    
    var body: some View {
        HStack(spacing: 0) {
            textItemColumn
            Spacer()
            valueItemColumn
        }
        .padding()
        .frame(height: 40)
    }
}

extension TextValueRow {
    private var textItemColumn: some View {
        HStack(spacing: 0) {
            Text(textItem)
                .bold()
        }
    }
    
    private var valueItemColumn: some View {
        VStack(alignment: .trailing) {
            Text(valueItem)
        }
    }
}



#Preview {
    TextValueRow(textItem: "Item text", valueItem: "Item value")
}
