//
//  Extensions.swift
//  MP3
//
//  Created by Vishal Manhas on 17/08/24.
//

import Foundation

extension DateComponentsFormatter{
    static let abbrevated:DateComponentsFormatter = {
        print("Intitilized DateComponentsFormatter.abbreviated")
        let formatter = DateComponentsFormatter()
        
        formatter.allowedUnits = [.hour,.minute,.second]
        formatter.unitsStyle = .abbreviated
        
        return formatter
    }()
    
    
    static let positional:DateComponentsFormatter = {
        print("Intitilized DateComponentsFormatter.positional")
        let formatter = DateComponentsFormatter()
        
        formatter.allowedUnits = [.minute,.second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        return formatter
    }()
}
