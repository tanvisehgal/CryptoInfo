//
//  CryptoRowView.swift
//  CryptoInfo
//
//  Created by Tanvi Sehgal on 2/12/23.
//

import SwiftUI

// One row displaying cryptocurrency data
struct CryptoRowView: View {
    
    var crypto: CryptoModel
    @StateObject var vm: CryptoViewModel

    
    var body: some View {
        HStack {
            // Circle placeholder for logo
            Image(systemName: "circle")
            Text("\(crypto.name)")
            Spacer()
            Text("\(crypto.current_price)")
            Image(systemName: crypto.isFavorite ?? false ? "star.fill" : "star")
                .foregroundColor(crypto.isFavorite ?? false ? .yellow : .black)
                .onTapGesture {
                    // call view model method when star is tapped
                    vm.toggleFavorites(symbol: crypto.symbol)
//                    crypto.isFavorite?.toggle()
                }
        }
    }
}

//struct CryptoRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        CryptoRowView(crypto: testData[1])
//    }
//}
