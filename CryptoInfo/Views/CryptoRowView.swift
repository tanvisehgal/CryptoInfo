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
            AsyncImage(url: URL(string: crypto.image)) { phase in
                if let image = phase.image {
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 50, maxHeight: 50)
                } else {
                    Image(systemName: "dollarsign.circle")
                        .frame(width: 50, height: 50)
                        .aspectRatio(contentMode: .fit)
                }
            }
            Text("\(crypto.name)")
            Spacer()
            Text(NumberFormatter.localizedString(from: crypto.current_price as NSNumber, number: .currency))
            Image(systemName: crypto.isFavorite ?? false ? "star.fill" : "star")
                .foregroundColor(crypto.isFavorite ?? false ? .yellow : .black)
                .onTapGesture {
                    // call view model method when star is tapped
                    vm.toggleFavorites(symbol: crypto.symbol)
                    //  crypto.isFavorite?.toggle()
                }
        }
    }
}

//struct CryptoRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        CryptoRowView(crypto: testData[1])
//    }
//}
