//
//  MP3App.swift
//  MP3
//
//  Created by Vishal Manhas on 17/08/24.
//

import SwiftUI
import SwiftData

@main
struct MP3App: App {
@StateObject var audionManager = AudioManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(audionManager)
        }
        
    }
}
