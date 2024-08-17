//
//  PlayerView.swift
//  MP3
//
//  Created by Vishal Manhas on 17/08/24.
//

import SwiftUI

struct PlayerView: View {
    
    @EnvironmentObject var audioManger:AudioManager
    var meditaitonVM:MeditationViewModel
    @State private var value:Double = 0.0
    var isPreview:Bool = false
    @Environment (\.dismiss) var dismiss
    
    
    @State private var isEditing:Bool = false
    let timer = Timer
        .publish(every: 0.5, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        ZStack{
            Image(meditaitonVM.meditaiton.image)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width)
                .ignoresSafeArea()
            
            Rectangle()
                .background(.thinMaterial)
                .opacity(0.25)
                .ignoresSafeArea()
            
            VStack(spacing: 20){
                
                HStack{
                    Button {
                        audioManger.stop()
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 36))
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                }
                
                Text(meditaitonVM.meditaiton.title)
                    .font(.title)
                    .foregroundColor(.white)
                
                Spacer()
                
                if let player = audioManger.player{
                    VStack(spacing: 5){
                        
                        Slider(value: $value,in: 0...player.duration){ editing in
                            isEditing = editing
                            if !editing {
                                player.currentTime = value
                            }
                        }
                            .accentColor(.white)
                        
                        HStack{
                            Text(DateComponentsFormatter.positional.string(from: player.currentTime) ?? "0:00")
                            
                            Spacer()
                            Text(DateComponentsFormatter.positional.string(from:player.duration -  player.currentTime) ?? "1:00")
                        }
                        .font(.caption)
                        .foregroundColor(.white)
                        
                    }
                    
                    HStack{
                        
                        let color:Color = audioManger.isLooping ? .teal : .white
                        PlayBackControllButton(systemName:  "repeat",color: color){
                            audioManger.toogleLopp()
                        }
                        Spacer()
                        PlayBackControllButton(systemName: "gobackward.10"){
                            player.currentTime -= 10
                        }
                        Spacer()
                        PlayBackControllButton(systemName: audioManger.isPlaying ? "pause.circle.fill": "play.circle.fill",fontSize: 44){
                            audioManger.playPause()
                        }
                        Spacer()
                        PlayBackControllButton(systemName: "goforward.10"){
                            player.currentTime += 10
                        }
                        Spacer()
                        PlayBackControllButton(systemName: "stop.fill"){
                            audioManger.stop()
                            dismiss()
                        }
                    }
                    
                }
            }
            .padding(20)
        }.onAppear{
            
            
       audioManger.startPlayer(track: meditaitonVM.meditaiton.track,isPreview: isPreview)
        }
        .onReceive(timer){ _ in
            guard let player = audioManger.player,!isEditing else {return}
            value = player.currentTime
        }
      
    }
}

#Preview {
    PlayerView(meditaitonVM: MeditationViewModel(meditaiton: Meditation.data),isPreview: true)
        .environmentObject(AudioManager())
}
