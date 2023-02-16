//
//  HomeView.swift
//  CryptoInfo
//
//  Created by Tanvi Sehgal on 2/12/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: CryptoView(vm: CryptoViewModel(), showFavoritesOnly: false)) {
                    Text("View Crypto Data")
                }
                NavigationLink(destination: TweetView(vm: TweetViewModel())) {
                    Text("Show Tweets")
                }
            }
            .navigationTitle("Crypto Info")
                
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
