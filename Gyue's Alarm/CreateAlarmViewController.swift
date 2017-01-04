//
//  CreateAlarmViewController.swift
//  Gyue's Alarm
//
//  Created by 조여규 on 03/01/2017.
//  Copyright © 2017 조여규. All rights reserved.
//

import UIKit
import MediaPlayer

class CreateAlarmViewController: UITableViewController, MPMediaPickerControllerDelegate {
    
    let cancelAlarmButtonItem = UIBarButtonItem(
        title: "취소",
        style: .plain,
        target: nil,
        action: #selector(cancel(sender:))
    )
    
    let saveAlarmButtonItem = UIBarButtonItem(
        title: "만들기",
        style: .plain,
        target: nil,
        action: #selector(save(sender:))
    )
    
    
    var didSelectAlarm: ((Alarm) -> Void)?
    
    @IBOutlet var titleLable: UITextField!
    
    @IBOutlet var mediaCell: UITableViewCell!
    @IBOutlet var mediaImageView: UIImageView!
    
    var mediaItem: MPMediaItem?
    
    init() {
        super.init(style: .plain)
    }
  
     required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.view.backgroundColor = .white
        
        self.saveAlarmButtonItem.target = self
        self.saveAlarmButtonItem.action =
        #selector(save(sender:))
        
        self.cancelAlarmButtonItem.target = self
        self.cancelAlarmButtonItem.action =
        #selector(cancel(sender:))
        
        self.navigationItem.leftBarButtonItem = self.cancelAlarmButtonItem
        self.navigationItem.rightBarButtonItem = self.saveAlarmButtonItem
        
        self.tableView.frame = self.view.bounds
    }
    
    @IBAction func cancel(sender: AnyObject) {
        navigationController?.presentingViewController?.dismiss(animated: true, completion: {});
    }
    
    @IBAction func save(sender: AnyObject) {
        
        if ( mediaItem == nil || (titleLable.text?.isEmpty)!) {
            return
        }
        
        let alarm = Alarm(title: titleLable.text!, music: mediaItem!)
        
        navigationController?.presentingViewController?.dismiss(animated: true, completion: {
            
            let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
            
            appDelegate.addAlarm(alarm: alarm)
        })
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        if (cell == mediaCell) {
            let mediaPicker = MPMediaPickerController(mediaTypes: .music)
            mediaPicker.delegate = self
            mediaPicker.prompt = "Select Any Music!"
            mediaPicker.allowsPickingMultipleItems = false
            present(mediaPicker, animated: true, completion: {})
        }
        
    }
    
    func mediaPicker(_ mediaPicker: MPMediaPickerController, didPickMediaItems mediaItems: MPMediaItemCollection) -> Void
    {
        let aMediaItem = mediaItems.items[0] as MPMediaItem
        if (( aMediaItem.artwork ) != nil) {
            mediaImageView.image = aMediaItem.artwork?.image(at: mediaCell.contentView.bounds.size)
            mediaImageView.isHidden = false
        }
        
        self.mediaItem = aMediaItem
        self.dismiss(animated: true, completion: {})
    }
    
    func mediaPickerDidCancel(_ mediaPicker: MPMediaPickerController) {
        self.dismiss(animated: true, completion: {})
    }
    
}
