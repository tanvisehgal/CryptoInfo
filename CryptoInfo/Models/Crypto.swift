//
//  Crypto.swift
//  CryptoInfo
//
//  Created by Tanvi Sehgal on 2/12/23.
//

import Foundation

struct Crypto: Identifiable, Codable {
    let id: String
    let symbol: String
    let name: String
    let image: String
    let current_price: Int
    
}

let testData = [
    Crypto(id: "1", symbol: "BTC", name: "Bitcoin", image: "", current_price: 20),
    Crypto(id: "2", symbol: "ETH", name: "Ethereum", image: "", current_price: 30),
    Crypto(id: "3", symbol: "TET", name: "Tether", image: "", current_price: 40)
]
