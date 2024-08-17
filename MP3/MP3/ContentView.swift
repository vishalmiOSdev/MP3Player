//
//  ContentView.swift
//  MP3
//
//  Created by Vishal Manhas on 17/08/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
  
    var body: some View {
        MeditationView(meditationVM: MeditationViewModel(meditaiton: Meditation.data))
    }
}

#Preview {
    ContentView()
        .environmentObject(AudioManager())
     
}
