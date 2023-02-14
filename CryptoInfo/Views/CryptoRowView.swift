//
//  CryptoRowView.swift
//  CryptoInfo
//
//  Created by Tanvi Sehgal on 2/12/23.
//

import SwiftUI

struct CryptoRowView: View {
    
    @State var crypto: CryptoModel
    
    var body: some View {
        HStack {
            
            Image(systemName: "circle")
            Text("\(crypto.name)")
            Spacer()
            Text("\(crypto.current_price)")
            Image(systemName: "star")
                .foregroundColor(crypto.isFavorite ?? false ? .yellow : .black)
                .onTapGesture {
                    print("tapped star")
                    print(crypto.isFavorite)
                    crypto.isFavorite?.toggle()
                    print("toggled")
                    print(crypto.isFavorite)
                }
            
        }
    }
}

struct CryptoRowView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoRowView(crypto: testData[0])
    }
}
