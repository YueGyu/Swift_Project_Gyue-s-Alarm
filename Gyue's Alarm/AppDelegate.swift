//
//  AppDelegate.swift
//  Gyue's Alarm
//
//  Created by 조여규 on 03/01/2017.
//  Copyright © 2017 조여규. All rights reserved.
//

import UIKit
import MediaPlayer

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var alarms: Dictionary<String, Alarm> = Dictionary(minimumCapacity: 0)
    var mainViewController: MainViewController!
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?)
        -> Bool {
 
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window?.backgroundColor = .white
            self.window?.makeKeyAndVisible()
//            self.window?.rootViewController = MainViewController()
//            self.window?.rootViewController = UINavigationController(rootViewController: MainViewController)
            
            let mainViewController = MainViewController()
            let navigationController = UINavigationController(rootViewController: mainViewController)
            self.window?.rootViewController = navigationController
            
        return true
    }
    
    func addAlarm(alarm:Alarm!) {
        
        mainViewController.objects.append(alarm)
        mainViewController.tableView.reloadData()
        
    }
    
    func launchAlarmViewController(alarm:Alarm!) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let alarmVC = storyBoard.instantiateViewController(withIdentifier: "alarm") as! AlarmViewController
        alarmVC.alarm = alarm
        let nav = UINavigationController(rootViewController: alarmVC)
        mainViewController.present(nav, animated: true, completion: {})
        
    }
    
    
}

