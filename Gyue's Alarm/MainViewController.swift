//
//  MainViewController.swift
//  Gyue's Alarm
//
//  Created by 조여규 on 03/01/2017.
//  Copyright © 2017 조여규. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
    
    let createAlarmButton = UIBarButtonItem(
        title: "만들기",
        style: .plain,
        target: nil,
        action: #selector(createAlarmButtonItemDidSelect)
    )
    
    var alarm: Alarm?
    
    var objects: [Alarm] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createAlarmButton.target = self
        self.createAlarmButton.action =
        #selector(createAlarmButtonItemDidSelect)
        self.navigationItem.rightBarButtonItem = self.createAlarmButton
        self.tableView.frame = self.view.bounds
        
    }
    
    override func numberOfSections(in tableView: UITableView)
        -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int {
        return objects.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        
        let object = objects[indexPath.row] as Alarm
        cell.textLabel?.text = object.title
        return cell
        
    }
    
    func createAlarmButtonItemDidSelect() {
        let createAlarmViewController = CreateAlarmViewController()
        createAlarmViewController.didSelectAlarm = { alarm in
            self.alarm = alarm
        }
        let navigationController = UINavigationController(
            rootViewController: createAlarmViewController
        )
        self.present(navigationController, animated: true, completion: nil)
    }
}
