//
//  CryptoView.swift
//  CryptoInfo
//
//  Created by Tanvi Sehgal on 2/12/23.
//

import SwiftUI

// Screen for crypto data
struct CryptoView: View {
    
    // State object so UI is notified when changed
    @StateObject var vm: CryptoViewModel
//    let cryptoData: [CryptoModel]
    @State var showFavoritesOnly: Bool = false
    @State var buttonText = "Show Favorites Only"

    var body: some View {
        
        NavigationView {
            VStack {
                Button(buttonText, action:  {
                    showFavoritesOnly.toggle()
                    if showFavoritesOnly {
                        self.buttonText = "Show All"
                    } else {
                        self.buttonText = "Show Favorites Only"
                    }
                    
                })
                List {
                    ForEach(vm.cryptoData) { crypto in
                        if showFavoritesOnly {
                            if crypto.isFavorite ?? false {
                                CryptoRowView(crypto: crypto, vm: vm)
                            }
                        } else {
                            CryptoRowView(crypto: crypto, vm: vm)
                        }
                    }
                    
                }
                .navigationTitle("Crypto Data")
            }

        }
    }
}

struct CryptoView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoView(vm: CryptoViewModel(cryptoData: testData), showFavoritesOnly: false)
    }
       
}
