//
//  ListViewModel.swift
//  EFCoinCap
//
//  Created by efulgencio on 12/4/24.
//

import Foundation
import Combine

final class ListViewModel: ObservableObject {
    
    @Published var assets = Assets()
    @Published var histories = HistoriesId()
    @Published var alertItem: AlertItem?
    
    private var listUseCase: ListUseCase
    private var task: Cancellable?
    
    init(listUseCase: ListUseCase = .live) {
        self.listUseCase = listUseCase
    }

    func getAssets() {
        task = listUseCase.getAssets().sink(
            receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure( _):
                    DispatchQueue.main.async {
                        self.alertItem = AlertContext.errorAPI
                    }
                }
            },
            receiveValue: { [weak self] response in
                DispatchQueue.main.async {
                    self?.assets = response
                }
            })
    }
}

extension ListViewModel {
    
   static  func getMock() -> ListViewModel {
        let listVM: ListViewModel = ListViewModel()
        var assets = Assets()
        assets.data = [Asset.Mock, Asset.Mock]
        listVM.assets = assets
        
        return listVM
    }
    
}
