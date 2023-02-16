//
//  TweetViewModel.swift
//  CryptoInfo
//
//  Created by Tanvi Sehgal on 2/16/23.
//

import Foundation

class TweetViewModel: ObservableObject {
    
    @Published var tweetListData: TweetListModel = TweetListModel(statuses: [])
    private let twitterAPIService = TwitterAPIService()
    
    init() {
        downloadData()
    }
    
    // gets tweetData from API call
    func downloadData() {
        twitterAPIService.getTwitterData(completionHandler: onDataReceived)
    }
    
    // After getting data from API set view model on main thread
    func onDataReceived(tweetListData: TweetListModel) {
        print("tweetdata: \(tweetListData)")
        self.tweetListData = tweetListData
    }
    
}
