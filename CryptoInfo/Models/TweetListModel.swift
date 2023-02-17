//
//  TweetModel.swift
//  CryptoInfo
//
//  Created by Tanvi Sehgal on 2/16/23.
//

import Foundation

// Nested structs due to nested JSON

// List of tweets
struct TweetListModel:Codable {
    let statuses: [TweetModel]
}

// Tweet
struct TweetModel: Identifiable, Codable {
    let id: Int
    let text: String
    let created_at: String
    let user: UserModel
}

// User Info
struct UserModel: Identifiable, Codable {
    let id: Int
    let name: String
    let screen_name: String
}

let testUserData = UserModel(id: 1, name: "tanvi s", screen_name: "tanvi_s")
let testTweetData = TweetModel(id: 1, text: "Mock Tweet hi #btc", created_at: "Wed Feb 15 08:40:00 +0000 2023", user: testUserData)
