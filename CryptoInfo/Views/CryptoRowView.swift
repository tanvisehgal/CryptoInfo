//
//  CryptoRowView.swift
//  CryptoInfo
//
//  Created by Tanvi Sehgal on 2/12/23.
//

import SwiftUI

struct CryptoRowView: View {
    
    let crypto: Crypto
    
    var body: some View {
        HStack {
            Image(systemName: "star")
            
            Text("\(crypto.name)")
            Spacer()
            Text("\(crypto.current_price)")
            
        }
    }
}

struct CryptoRowView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoRowView(crypto: testData[0])
    }
}
