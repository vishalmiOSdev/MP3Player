//
//  MeditationView.swift
//  MP3
//
//  Created by Vishal Manhas on 17/08/24.
//

import SwiftUI

struct MeditationView: View {
    
    @State private var showPlayer = false
    
    @StateObject  var meditationVM:MeditationViewModel
    
    var body: some View {
        VStack(spacing: 0 ){
            Image(meditationVM.meditaiton.image)
                .resizable()
                .scaledToFill()
                .frame(height: UIScreen.main.bounds.height / 3)
            
            ZStack{
                Color(red: 24/255, green: 23/255, blue: 22/255)
                
                VStack(alignment: .leading ,spacing: 24 ){
                    VStack(alignment: .leading,spacing: 8 ){
                        
                        Text("Music")
                        Text(DateComponentsFormatter.abbrevated.string(from: meditationVM.meditaiton.duration) ?? 
                            meditationVM.meditaiton.duration.formatted() + "S")
                        
                    }.font(.subheadline)
                        .textCase(.uppercase)
                        .opacity(0.7)
                    
                    Text(meditationVM.meditaiton.title)
                        .font(.title)
                    Button(action: {
                        showPlayer = true
                    }, label: {
                        Label("Play", systemImage: "play.fill")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding(.vertical,10)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius(20)
                    })
                    Text(meditationVM.meditaiton.discription)
                    
                    Spacer()
                }
                .foregroundColor(.white)
                .padding(20)
                
            }
            .frame(height: UIScreen.main.bounds.height  * 2 / 3)
        }
        .ignoresSafeArea()
        .fullScreenCover(isPresented: $showPlayer )  {
            PlayerView(meditaitonVM: meditationVM)
        }
    }
}

#Preview {
  
    
    MeditationView(meditationVM: MeditationViewModel(meditaiton: Meditation.data))
        .environmentObject(AudioManager())
}
