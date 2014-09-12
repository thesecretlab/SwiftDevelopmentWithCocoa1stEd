//
//  ViewController.swift
//  Notifications
//
//  Created by Jon Manning on 24/06/2014.
//  Copyright (c) 2014 Secret Lab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBAction func sendNotification(sender: AnyObject) {
        
        // BEGIN sending_local_notification
        var localNotification = UILocalNotification()
        localNotification.fireDate = NSDate(timeIntervalSinceNow: 3);
        localNotification.category = "com.oreilly.MyApplication.message"
        localNotification.alertBody = "The world is in peril!"
        
        UIApplication.sharedApplication()
            .scheduleLocalNotification(localNotification)
        // END sending_local_notification
        
        /*
        // BEGIN sending_local_notification_now
        UIApplication.sharedApplication()
            .presentLocalNotificationNow(localNotification)
        // END sending_local_notification_now
        */
        
    }
    
    @IBAction func cancelNotifications(sender: AnyObject) {
        /*
        // BEGIN cancel_specific_local_notification
        var aNotification : UILocalNotification = ...
        UIApplication.sharedApplication().cancelLocalNotification(aNotification)
        // END cancel_specific_local_notification
        */
        
        
        // BEGIN cancel_all_local_notifications
        UIApplication.sharedApplication().cancelAllLocalNotifications()
        // END cancel_all_local_notifications
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

