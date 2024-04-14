//
//  ListView.swift
//  EFCoinCap
//
//  Created by efulgencio on 12/4/24.
//

import SwiftUI

class AssetData: ObservableObject {
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
        assetData.idSelected = asset.id ?? "nulo"
        showDetailView.toggle()
    }
    
}


/*
 NavigationView {
     VStack {
         header
         assetsList
     }
 }
 .onAppear {
     Task {
         async let fetchAsset: () = viewModel.getAssets()
         let _ =  await (fetchAsset)
     }
 }
 */



