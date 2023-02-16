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


