//
//  CryptoView.swift
//  CryptoInfo
//
//  Created by Tanvi Sehgal on 2/12/23.
//

import SwiftUI

struct CryptoView: View {
    
    @StateObject var vm: CryptoViewModel
//    let cryptoData: [CryptoModel]

    var body: some View {
        
        NavigationView {
            
            List {
                ForEach(vm.cryptoData) { crypto in
                    CryptoRowView(crypto: crypto)
                }
                .navigationTitle("Crypto Data")
                
            }
        }
    }
}

struct CryptoView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoView(vm: CryptoViewModel(cryptoData: testData))
    }
       
}
