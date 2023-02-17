//
//  TweetRowView.swift
//  CryptoInfo
//
//  Created by Tanvi Sehgal on 2/16/23.
//

import SwiftUI

struct TweetRowView: View {
    
    var tweet: TweetModel
    
    func formatDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E MMM d HH:mm:ss Z yyyy"
        let date = dateFormatter.date(from: tweet.created_at)
        dateFormatter.dateFormat = "MMM d"
        let dateString = dateFormatter.string(from: date!)
        return dateString
    }
    
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(tweet.user.name)
                    .bold()
                Spacer()
                Text("@\(tweet.user.screen_name)")
            }
            Text(formatDate())
                .font(.caption)
            Text(tweet.text)
        }
    }
}

struct TweetRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetRowView(tweet: testTweetData)
    }
}
