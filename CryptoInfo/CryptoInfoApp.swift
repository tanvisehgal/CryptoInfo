//
//  CryptoInfoApp.swift
//  CryptoInfo
//
//  Created by Tanvi Sehgal on 2/12/23.
//

import SwiftUI

@main
struct CryptoInfoApp: App {
    
    @StateObject var vm = CryptoViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
        }
    }
}
