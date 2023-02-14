//
//  CoinGeckoService.swift
//  CryptoInfo
//
//  Created by Tanvi Sehgal on 2/13/23.
//

import Foundation

// Fetch Crypto data from CoinGecko API
class CoinGeckoServie {
 
    // Published allows subscriber to know when data
    // has changed
    @Published var cryptoData: [CryptoModel] = []
    
    let NUM_ITEMS: Int = 10
    
    // async function - need to await result
    func getCryptoData() async throws -> [CryptoModel] {
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=\(NUM_ITEMS)&page=1&sparkline=false") else {
            print("Invalid URL")
            return []
        }
        
        do {
            // dont know when it will finish so we await until data is received
            let (data, response) = try await URLSession.shared.data(from: url)
            
            print("data coded")
            print(data)
            
            let decodedResponse = try JSONDecoder().decode([CryptoModel].self, from: data)


            print("Decoded Response:")
            print(decodedResponse)
            
            return decodedResponse
        } catch {
            print("error fetching data")
            print(error)
            throw error
        }
        
    }
    
}
