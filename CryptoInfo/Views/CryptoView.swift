//
//  CryptoView.swift
//  CryptoInfo
//
//  Created by Tanvi Sehgal on 2/12/23.
//

import SwiftUI

struct CryptoView: View {
    
    let cryptoData: [Crypto]
    
    var body: some View {
        
        List(cryptoData) { crypto in
            CryptoRowView(crypto: crypto)
        }
  

    }
}

struct CryptoView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoView(cryptoData: testData)
    }
}
