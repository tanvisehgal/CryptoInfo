//
//  CryptoViewModel.swift
//  CryptoInfo
//
//  Created by Tanvi Sehgal on 2/13/23.
//

import Foundation

// Observable object allows SwiftUI to be informed
// when object changes
class CryptoViewModel: ObservableObject {
    
    // Published allows us to create observable objects
    // that automatically announce when changes occur
    @Published var cryptoData: [CryptoModel] = []
    
    private let coinGeckoService = CoinGeckoServie()

    init() {
        Task.init {
            await downloadData()
            print(self.cryptoData)
        }
        
    }
    
    // initializer w arguments for preview
    init(cryptoData: [CryptoModel]) {
        self.cryptoData = cryptoData
    }
    
    func downloadData() async {
        do {
            self.cryptoData = try await coinGeckoService.getCryptoData()
        } catch {
            print("Error downloading data")
        }
    }
    
    
    
}
