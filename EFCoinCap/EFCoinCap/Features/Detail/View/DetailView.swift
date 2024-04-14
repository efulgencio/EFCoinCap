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

#Preview {
    DetailView()
}

extension DetailView {
    
    private var header: some View {
        HStack {
            Text("Asset / History")
                .font(.headline)
                .fontWeight(.heavy)
                .animation(.none)
        }
        .padding(.horizontal)
    }
    
    private var assetSection: some View {
        Section(header: Text("")) {
            VStack(alignment: .leading) {
                Group {
                    Text("id: \(viewModel.asset?.data?.id ?? "")")
                    Text("rank: \(viewModel.asset?.data?.rank ?? "")")
                    Text("symbol: \(viewModel.asset?.data?.symbol ?? "")")
                    Text("name: \(viewModel.asset?.data?.name ?? "")")
                    Text("maxSupply: \(viewModel.asset?.data?.maxSupply?.toDouble().asCurrencyWithDecimals() ?? "")")
                    Text("marketCapUsd: \(viewModel.asset?.data?.marketCapUsd?.toDouble().asCurrencyWithDecimals() ?? "")")
                    Text("volumeUsd24Hr: \(viewModel.asset?.data?.volumeUsd24Hr?.toDouble().asCurrencyWithDecimals() ?? "")")
                    Text("priceUsd: \(viewModel.asset?.data?.priceUsd?.toDouble().asCurrencyWithDecimals() ?? "")")
                    Text("changePercent24Hg: \(viewModel.asset?.data?.changePercent24Hr?.toDouble().asCurrencyWithDecimals() ?? "")")
                    Text("vwap24Hr: \(viewModel.asset?.data?.vwap24Hr?.toDouble().asCurrencyWithDecimals() ?? "")")
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




/*
 Text("Valor pasado: \(assetData.idSelected)")
 Text("Histórico: \(viewModel.histories?.data.count ?? 0)")
 Text("Symbolo de asset remoto: \(viewModel.asset?.data?.symbol! ?? "")")
 Text("Fecha: \(viewModel.asset?.timestamp.formatearFechaDesdeTimestamp() ?? "")")
 */
