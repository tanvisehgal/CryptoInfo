//
//  CryptoViewModel.swift
//  CryptoInfo
//
//  Created by Tanvi Sehgal on 2/13/23.
//

import Foundation

// Observable object allows SwiftUI to be informed
// when object changes
@MainActor class CryptoViewModel: ObservableObject {
    
    // Published allows us to create observable objects
    // that automatically announce when changes occur
    @Published var cryptoData: [CryptoModel] = []
    
    var realmManager: RealmManager = RealmManager()
    
    private let coinGeckoService = CoinGeckoServie()
    

    init() {
        Task.init {
            await downloadData()
            initializeFavorites()
//            realmManager.deleteAll()
            readFavorites()
            print(self.cryptoData)
        }
        let timer = Timer.scheduledTimer(withTimeInterval: 30, repeats: true) {
            timer in
            Task {
                await self.downloadData()
                await self.initializeFavorites()
                await self.readFavorites()


            }
        }
        
    }
    
    // initializer w arguments for preview
    init(cryptoData: [CryptoModel]) {
        self.cryptoData = cryptoData
    }
    
    // sets cryptoData to data from API call
    func downloadData() async {
        do {
            self.cryptoData = try await coinGeckoService.getCryptoData()
            print("called")

        } catch {
            print("Error downloading data")
        }
    }
    
    
    // Sets all favorites to false
    func initializeFavorites() {
        for (index, _) in cryptoData.enumerated() {
            // initial toggle favorite sets all values to false
//            cryptoData[index] = crypto.toggleFavorite()
            cryptoData[index].isFavorite = false
        }
    }
    
    //
    func toggleFavorites(symbol: String) {
//        cryptoData[index] = cryptoData[index].toggleFavorite()
        
        // Finds index in cryptodata array where symbol matches up
        let index = cryptoData.firstIndex(where: {$0.symbol == symbol})
        
        guard (index != nil) else {return}

        // switches isFavorite boolean
        cryptoData[index!].isFavorite?.toggle()
        // if favorited, add to realm
        if (cryptoData[index!].isFavorite ?? false) {
            realmManager.saveFavorite(crypto: cryptoData[index!])
    
        } else {
            // if unfavorited, delete from realm
            realmManager.deleteFavorite(crypto: cryptoData[index!])
        }
    }
    
    // get all favorites from realm and set cryptomodel favorites
    func readFavorites() {
        let allFavorites: [CryptoPersistentModel] = realmManager.readAllFavorites()
        
        allFavorites.forEach { fav in
            let index = cryptoData.firstIndex(where: {$0.symbol == fav.symbol})
            print("Favoriting item \(index!)")
            cryptoData[index!].isFavorite = true
        }
    }
    
    
    
}
