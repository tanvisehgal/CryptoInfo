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
    
    var realmManager: RealmManager = RealmManager()
    
    private let coinGeckoService = CoinGeckoServie()
    
    
    init() {
        downloadData()
        // timer needs to be turned off at some point
        
//        let timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) {
//            timer in
//            self.downloadData()
//        }
    }
    
    // initializer w arguments for preview
    init(cryptoData: [CryptoModel]) {
        self.cryptoData = cryptoData
    }
    
    // gets data from API call
    func downloadData() {
        coinGeckoService.getCryptoData(completionHandler: onDataReceived)
        //      self.cryptoData = try await coinGeckoService.getCryptoData()
    }
    
    // After getting data from API set view model on main thread
    func onDataReceived(cryptoData: [CryptoModel]) {
        print("crypto data received: \(cryptoData[0].current_price)")
        self.cryptoData = cryptoData
        initializeFavorites()
        readFavorites()
    }
    
    
    // Sets all favorites to false
    func initializeFavorites() {
        for (index, _) in cryptoData.enumerated() {
            cryptoData[index].isFavorite = false
        }
    }
    
    // Handles when the favorite button is clicked
    func toggleFavorites(symbol: String) {
        //       cryptoData[index] = cryptoData[index].toggleFavorite()
        
        // Finds index in cryptodata array where symbol matches up
        let index = cryptoData.firstIndex(where: {$0.symbol == symbol})
        
        guard let index = index else {return}
//        guard (index != nil) else {return}
        
        // switches isFavorite boolean
        cryptoData[index].isFavorite?.toggle()
        // if favorited, add to realm
        if (cryptoData[index].isFavorite ?? false) {
            realmManager.saveFavorite(crypto: cryptoData[index])
        } else {
            // if unfavorited, delete from realm
            realmManager.deleteFavorite(crypto: cryptoData[index])
        }
    }
    
    // get all favorites from realm and set cryptomodel favorites
    func readFavorites() {
        let allFavorites: [CryptoPersistentModel] = realmManager.readAllFavorites()
        
        allFavorites.forEach { fav in
            let index = cryptoData.firstIndex(where: {$0.symbol == fav.symbol})
            cryptoData[index!].isFavorite = true
        }
    }
    
    
    
}
