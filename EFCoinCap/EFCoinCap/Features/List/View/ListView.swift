//
//  ListView.swift
//  EFCoinCap
//
//  Created by efulgencio on 12/4/24.
//

import SwiftUI

final class AssetData: ObservableObject {
    @Published var idSelected: String = ""
}

struct ListView: View {
    
    @ObservedObject var viewModel = ListViewModel()
    @StateObject var assetData = AssetData()
    
    @State private var showDetailView: Bool = false
    
    var body: some View {
        VStack {
            header
            assetsList
        }
        .sheet(isPresented: $showDetailView, content: {
            DetailView()
        })
        .onAppear {
            Task {
                // if I have more net fetch I can use for concurrency
                // async let fetchAsset1: () = viewModel.getAssets1()
                // async let fetchAsset2: () = viewModel.getAssets2()
                // let (_, _) = await (fetchAsset1, fetchAsset2)
                
                async let fetchAsset: () = viewModel.getAssets()
                let _ =  await (fetchAsset)
            }
        }.environmentObject(assetData)
    }
}

extension ListView {
    
    private var header: some View {
        HStack {
            Text("Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .animation(.none)
        }
        .padding(.horizontal)
    }
    
    private var assetsList: some View {
        List {
            ForEach(viewModel.assets.data, id: \.self) { asset in
                AssetRow(asset: asset)
                    .onTapGesture {
                        segue(asset: asset)
                    }
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private func segue(asset: Asset) {
        if let assetId = asset.id {
            assetData.idSelected = assetId
            showDetailView.toggle()
        }
    }
    
}

// Alert views

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let errorAPI = AlertItem(title: Text("Error"), message: Text("EFCoinCap ERROR"), dismissButton: .default(Text("Accept")))
}
