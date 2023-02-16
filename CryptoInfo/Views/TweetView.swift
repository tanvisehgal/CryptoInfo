//
//  TweetView.swift
//  CryptoInfo
//
//  Created by Tanvi Sehgal on 2/14/23.
//

import SwiftUI

struct TweetView: View {
    
    @StateObject var vm:TweetViewModel
    
    var body: some View {
        VStack {
            List {
                ForEach(vm.tweetListData.statuses) { tweet in
                    Text(tweet.text)
                }
            }
            .navigationTitle("Tweet Data")
        }
    }
}

//struct TweetView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetView()
//    }
//}
