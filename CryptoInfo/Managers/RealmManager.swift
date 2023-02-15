//
//  RealmManager.swift
//  CryptoInfo
//
//  Created by Tanvi Sehgal on 2/14/23.
//

import Foundation
import RealmSwift

// Realm Manager Class for data persistence
class RealmManager: ObservableObject {
    private var realmDataStore: Realm?
    
    
    init() {
        do {
            Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 3)
            realmDataStore = try Realm()
        } catch {
            print("Error setting up realm \(error)")
        }
    }
    
    // Add CryptoPersistentModel to realm when favorited
    func saveFavorite(crypto: CryptoModel) {
        do {
            try realmDataStore!.write {
                realmDataStore!.add(CryptoPersistentModel(crypto: crypto))
            }
            print("saving favorite realm")
        } catch {
            print("Error saving favorite in realm \(error)")
        }
    }
    
    // Delete CryptoPersistentModel from realm when unfavorited
    func deleteFavorite(crypto: CryptoModel) {
        do {
            let cryptoFavToDelete = realmDataStore?.objects(CryptoPersistentModel.self).filter(NSPredicate(format: "symbol == %@", crypto.symbol))
            print("delete fav realm crypto: \(cryptoFavToDelete)")
//            if ((cryptoFavToDelete?.isEmpty) != nil) {
//                return
//            }
            try realmDataStore!.write {
                realmDataStore!.delete(cryptoFavToDelete!)
            }
            print("deleting favorite realm")
        } catch {
            print("error deleting favorite \(error)")
        }
    }
    
    // Delete all items from realm
    func deleteAll() {
        do {
            try realmDataStore?.write {
                realmDataStore?.deleteAll()
            }
            print("deleting all realm")
        } catch {
            print("error deleting all \(error)")
        }
    }
    
    // Return array of CryptoPersistentModel of all favorited cryptos
    func readAllFavorites() -> [CryptoPersistentModel] {
        do {
            let allFavorites = realmDataStore?.objects(CryptoPersistentModel.self)
            var favoritesArray: [CryptoPersistentModel] = []
            allFavorites?.forEach{favorite in
                favoritesArray.append(favorite)
            }
            return favoritesArray
        } catch {
            print("Error reading favorites \(error)")
        }
    }
    
}
