//
//  MeditationViewModel.swift
//  MP3
//
//  Created by Vishal Manhas on 17/08/24.
//

import Foundation

final class MeditationViewModel:ObservableObject{
    
    private(set) var meditaiton:Meditation
    
    init(meditaiton: Meditation) {
        self.meditaiton = meditaiton
    }
    
}

struct Meditation{
    let id = UUID()
    let title:String
    let discription:String
    let duration:Double
    let track:String
    let image:String
    
    static let data = Meditation(title: "1 minute relaxing meditation.", discription: "Clear your mind and slumber into nothingness.", duration: 70, track: "beleive", image: "meditation")
}
