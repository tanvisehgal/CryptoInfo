//
//  Crypto.swift
//  CryptoInfo
//
//  Created by Tanvi Sehgal on 2/12/23.
//

import Foundation
import RealmSwift

// Codable provides compatibility w JSON
// Identifiable so each instance has a unique ID
struct CryptoModel: Identifiable, Codable {
    let id: String
    let symbol: String
    let name: String
    let image: String
    var current_price: Double
    var isFavorite: Bool?
}

// class for Realm
class CryptoPersistentModel: Object, ObjectKeyIdentifiable  {
//    @Persisted var id: ObjectId
    @Persisted(primaryKey: true) var symbol: String
    @Persisted var isFavorite: Bool
    
    override init() {
        super.init()
    }
    
    init(crypto: CryptoModel) {
        super.init()
        self.symbol = crypto.symbol
        self.isFavorite = crypto.isFavorite ?? false
    }
}



//let testData = [
//    CryptoModel()
//]

let testData = [
    CryptoModel(id: "1", symbol: "BTC", name: "Bitcoin", image: "", current_price: 20, isFavorite: false),
    CryptoModel(id: "2", symbol: "ETH", name: "Ethereum", image: "", current_price: 3000, isFavorite: true),
    CryptoModel(id: "3", symbol: "TET", name: "Tether", image: "", current_price: 400, isFavorite: false)
]
