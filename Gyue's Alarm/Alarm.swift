//
//  Alarm.swift
//  Gyue's Alarm
//
//  Created by 조여규 on 03/01/2017.
//  Copyright © 2017 조여규. All rights reserved.
//


import UIKit
import MediaPlayer

class Alarm: NSObject {
    
    var title:String
    var music:MPMediaItem
    
    init( title:String, music:MPMediaItem ) {
        self.title = title
        self.music = music
        
    }
    
}
