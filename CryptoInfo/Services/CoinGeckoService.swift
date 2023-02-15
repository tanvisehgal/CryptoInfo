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
    
    // Num cryptocurrencies to pull from API
    let NUM_ITEMS: Int = 10
    
    // Returns an array of cryptomodel using data from API call
    // async function - need to await result
    func getCryptoData(completionHandler: @escaping (([CryptoModel]) -> Void)) {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=\(NUM_ITEMS)&page=1&sparkline=false")
        else {
            print("Invalid URL")
            return
        }
        let task = URLSession.shared.dataTask(with: url) {data,response,error in
            
            do {
                let decodedResponse = try JSONDecoder().decode([CryptoModel].self, from: data!)
                DispatchQueue.main.async {
                    completionHandler(decodedResponse)
                }
            } catch {
                print("Error decoding JSON")
            }
            
        }
        task.resume()
        
        // dont know when it will finish so we await until data is received
        //            let (data, _) = URLSession.shared.data(from: url)
        //
        //            let decodedResponse = try JSONDecoder().decode([CryptoModel].self, from: data)
        //            return decodedResponse
        
        
    }
    
}
