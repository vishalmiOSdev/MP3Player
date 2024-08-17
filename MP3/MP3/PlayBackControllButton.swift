//
//  PlayBackControllButton.swift
//  MP3
//
//  Created by Vishal Manhas on 17/08/24.
//

import SwiftUI

struct PlayBackControllButton: View {
    var systemName:String = "play"
    var fontSize:CGFloat = 24
    var color:Color = .white
    var action:() -> Void
    var body: some View {
        Button{
            action()
        }label: {
            Image(systemName: systemName)
                .font(.system(size: fontSize))
                .foregroundColor(color)
        }
    }
}

#Preview {
    PlayBackControllButton( action: {})
        .preferredColorScheme(.dark)
}
