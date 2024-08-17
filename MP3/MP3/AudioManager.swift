//
//  AudioManager.swift
//  MP3
//
//  Created by Vishal Manhas on 17/08/24.
//

import Foundation
import AVKit

final class AudioManager:ObservableObject{
    
//    static let shared  = AudioManager()
    
    var player:AVAudioPlayer?
    
    @Published private(set) var isPlaying:Bool = false{
        didSet{
            print("Is Playing\(isPlaying)")
        }
    }
    
    @Published private(set) var isLooping:Bool = false{
        didSet{
            print("Is isLooping\(isPlaying)")
        }
    }
    
    func startPlayer(track:String,isPreview:Bool = false){
        
        let url = Bundle.main.url(forResource: track, withExtension: "mp3")
        guard let url = url else {return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback,mode: .default)
            
            try AVAudioSession.sharedInstance().setActive(true)
            player  =  try AVAudioPlayer(contentsOf: url)
            if isPreview{
                player?.prepareToPlay()
            }else{
                player?.play()
                isPlaying = true
            }
        }catch{
            print("Fails t0 initilize fail")
        }
    }
    
    func playPause(){
        guard let player = player else{
            print("Instance od audio plaer not found")
            return
        }
        
        if player.isPlaying{
            player.pause()
            isPlaying = false
        }else{
            player.play()
            isPlaying = true
        }
    }
    
    func stop(){
        
        guard let player = player else{
            return
        }
        
        if player.isPlaying{
            player.stop()
            isPlaying = false
        }else{
            player.play()
            isPlaying = true
        }
    }
    
    func toogleLopp(){
        guard let player = player else{
            return
        }
        
        player.numberOfLoops = player.numberOfLoops  == 0 ? -1 : 0
        isLooping = player.numberOfLoops != 0 
    }
    
}
