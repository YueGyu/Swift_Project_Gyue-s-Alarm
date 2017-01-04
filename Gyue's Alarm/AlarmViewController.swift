//
//  AlarmViewController.swift
//  Gyue's Alarm
//
//  Created by 조여규 on 03/01/2017.
//  Copyright © 2017 조여규. All rights reserved.
//

import UIKit
import MediaPlayer

class AlarmViewController: UIViewController {
    
    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer()
    var alarm: Alarm!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = alarm.title
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func playMusic(music: MPMediaItem!) {
        
        let array = [music]
        let collection = MPMediaItemCollection(items: array as! [MPMediaItem])
        
        musicPlayer.setQueue(with: collection)
        musicPlayer.play();
        
    }
    
    @IBAction func shutup(sender: AnyObject) {
        
        musicPlayer.stop()
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
}
