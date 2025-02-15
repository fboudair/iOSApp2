//
//  Assignment4AppApp.swift
//  Assignment4App
//
//  Created by Louise Rennick on 2025-02-06.
//

import SwiftUI

@main
struct Assignment4AppApp: App {
    @StateObject var userManager = UserManager()
    var body: some Scene {
        WindowGroup {
           if userManager.currentUser == nil {
               SplashScreenView()
                   .environmentObject(userManager)
            } else {
               ScavengerHuntView()
                    
           }
        }
    }
}
