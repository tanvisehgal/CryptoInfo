//
//  TwitterAPIService.swift
//  CryptoInfo
//
//  Created by Tanvi Sehgal on 2/15/23.
//

import Foundation

class TwitterAPIService {
    

    let COUNT = 10
    let HASHTAG = "btc"
    
    func getTwitterData(completionHandler: @escaping ((TweetListModel) -> Void)) {
        let token = "AAAAAAAAAAAAAAAAAAAAAAI6lwEAAAAAbIJRYcHvRb7d9M3tGZxfJ9SUw5Q%3DpaaFLyWS3j1QSpRmcaxhRQM6PMBPNq0LPEJjXreuSepqdZRyEO"
        
        guard let url = URL(string: "https://api.twitter.com/1.1/search/tweets.json?q=%23\(HASHTAG)&result_type=popular&count=\(COUNT)")
        else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) {data,response,error in
            
            do {
                let decodedResponse = try JSONDecoder().decode(TweetListModel.self, from: data!)
                
                // Call set view model function on main thread
                DispatchQueue.main.async {
                    completionHandler(decodedResponse)
                }
            } catch {
                print("Error decoding JSON")
            }
            
        }
        task.resume()
        
        
        
    }
}
