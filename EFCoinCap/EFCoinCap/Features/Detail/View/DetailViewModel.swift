//
//  DetailViewModel.swift
//  EFCoinCap
//
//  Created by efulgencio on 14/4/24.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
   
    @Published var histories: HistoriesId? = nil
    @Published var asset: AssetId? = nil
    
    private var detailUseCase: DetailUseCase
    private var task: Cancellable?

    init(detailUseCase: DetailUseCase = .live) {
        self.detailUseCase = detailUseCase
    }
    
    func getAssetId(id: String) {
        task = detailUseCase.getAssetId(id).sink(
            receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            },
            receiveValue: { [weak self] response in
                DispatchQueue.main.async {
                    self?.asset = response
                }
                // If ok then getHitoric
                self!.getHistories(id: id)
            })
    }
    
    func getHistories(id: String) {
        task = detailUseCase.getHistories(id).sink(
            receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            },
            receiveValue: { [weak self] response in
                DispatchQueue.main.async {
                    self?.histories = response
                }
            })
    }
    
}