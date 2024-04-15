//
//  DetailView.swift
//  EFCoinCap
//
//  Created by efulgencio on 14/4/24.
//

import SwiftUI

struct DetailView: View {

    @EnvironmentObject var assetData: AssetData
    @StateObject var viewModel = DetailViewModel()
    @State private var selectedOption = true
    
    var body: some View {
        
        VStack {
            header
            HStack {
                VStack {
                    Text("Asset")
                    Divider()
                       .frame(height: 6)
                       .background(selectedOption == true ? Color.themeOption.assetOption: Color.themeOption.unSelectedOption)
                }.onTapGesture {
                    selectedOption.toggle()
                }
                VStack {
                    Text("History")
                    Divider()
                       .frame(height: 6)
                       .background(selectedOption == false ? Color.themeOption.historyOption : Color.themeOption.unSelectedOption)
                }.onTapGesture {
                    selectedOption.toggle()
                }
            }
             ZStack {
                 if selectedOption {
                     assetSection
                 } else {
                     historySection
                 }
             }
             Spacer()
        }
        .padding()
        .onAppear {
            viewModel.getAssetId(id: assetData.idSelected)
        }
    }
}

extension DetailView {
    
    private var header: some View {
        HStack {
            Text("Asset / History")
                .customStyle()
        }
        .padding(.horizontal)
    }
    
    private var assetSection: some View {
        Section() {
            VStack(alignment: .leading) {
                Group {
                    TextValueRow(textItem: "Id", valueItem: "\(viewModel.asset?.data?.id ?? "")")
                    TextValueRow(textItem: "Rank", valueItem: "\(viewModel.asset?.data?.rank ?? "")")
                    TextValueRow(textItem: "Symbol", valueItem: "\(viewModel.asset?.data?.symbol ?? "")")
                    TextValueRow(textItem: "Name", valueItem: "\(viewModel.asset?.data?.name ?? "")")
                    TextValueRow(textItem: "MaxSuypply", valueItem: "\(viewModel.asset?.data?.maxSupply?.toDouble().formattedWithAbbreviations() ?? "")")
                    TextValueRow(textItem: "MarketCapUsd", valueItem: "\(viewModel.asset?.data?.marketCapUsd?.toDouble().formattedWithAbbreviations() ?? "")")
                    TextValueRow(textItem: "VolumeUsd24Hr", valueItem: "\(viewModel.asset?.data?.volumeUsd24Hr?.toDouble().formattedWithAbbreviations() ?? "")")
                    TextValueRow(textItem: "PriceUsd", valueItem: "\(viewModel.asset?.data?.priceUsd?.toDouble().formattedWithAbbreviations() ?? "")")
                    TextValueRow(textItem: "ChangePercent24Hg", valueItem: "\(viewModel.asset?.data?.changePercent24Hr?.toDouble().formattedWithAbbreviations() ?? "")")
                    TextValueRow(textItem: "Vwap24Hr", valueItem: "\(viewModel.asset?.data?.vwap24Hr?.toDouble().formattedWithAbbreviations() ?? "")")
                }
                .font(.callout)
                .fontWeight(.medium)
            }
            .padding(.vertical)
        }
    }
    
    private var historySection: some View {
        Section(header: Text("")) {
            VStack(alignment: .leading) {
                List {
                    ForEach(viewModel.histories!.data, id: \.self) { history in
                        HistoryRow(history: history)
                    }
                }
                .listStyle(PlainListStyle())
            }
            .padding(.vertical)
        }
    }
}

struct CustomTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .fontWeight(.heavy)
    }
}

extension Text {
    func customStyle() -> some View {
        self.modifier(CustomTextStyle())
    }
}


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

