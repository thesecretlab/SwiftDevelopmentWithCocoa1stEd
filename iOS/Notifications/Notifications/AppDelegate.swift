//
//  AppDelegate.swift
//  MultipleWindows
//
//  Created by Jon Manning on 23/06/2014.
//  Copyright (c) 2014 Secret Lab. All rights reserved.
//

// BEGIN multiple-windows
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window : UIWindow!
    
    /*
    // BEGIN remote_notification_on_start_osx
    func applicationDidFinishLaunching(_ aNotification: NSNotification!) {
        var remoteNotification = aNotification.userInfo[NSApplicationLaunchRemoteNotificationKey]
    
        if remoteNotification? {
            // do something with the notification info
        }
    }
    // END remote_notification_on_start_osx
    */
    
    
    /*
    // BEGIN remote_notification_on_start
    func application(application: UIApplication!, 
        didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool {
        
        var remoteNotification = launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey]
        
        if remoteNotification? {
            // do something with the notification info
        }
        
        return true;
    }
    // END remote_notification_on_start
    */
    
    /*
    // BEGIN local_notification_on_start
    func application(application: UIApplication!, 
        didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool {
    
        var localNotification = launchOptions[UIApplicationLaunchOptionsLocalNotificationKey
        
        if localNotification? {
            // do something with the notification info
        }
        
        return true;
        }
    // END local_notification_on_start
    */
    
    
    
    func application(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool {
        
        /*
        // BEGIN notification_settings_register
        // Indicating that we we want to deliver alerts
        let notificationSettings = UIUserNotificationSettings(
            forTypes: UIUserNotificationType.Alert, categories: nil)
        
        UIApplication.sharedApplication().registerUserNotificationSettings(
            notificationSettings)
        // END notification_settings_register
        */
        
        // BEGIN defining_alert_action
        let notificationAction = UIMutableUserNotificationAction()
        
        // The title is shown to the user
        notificationAction.title = "Save World"
        
        // The identifier is used by your app
        notificationAction.identifier = "saveWorldAction"
        
        // When this action is selected, bring the app to the foreground
        notificationAction.activationMode =
            UIUserNotificationActivationMode.Foreground
        
        // If true, the user must enter their passcode before the action runs. 
        // (Always set to true when the activation mode is Foreground.)
        notificationAction.authenticationRequired = false
        
        // Should the action be highlighted as destructive? (ie red and 
        // dangerous looking)
        notificationAction.destructive = false
        // END defining_alert_action
        
        // BEGIN defining_destructive_alert_action
        // This action will be presented as destructive
        let destructiveNotificationAction = UIMutableUserNotificationAction()
        
        // Conquering the world is generally destructive
        destructiveNotificationAction.title = "Conquer World"
        
        // This action will launch the app in the background
        destructiveNotificationAction.activationMode =
            UIUserNotificationActivationMode.Background
        
        // Highlight the action as destructive
        destructiveNotificationAction.destructive = true
        // END defining_destructive_alert_action
        
        destructiveNotificationAction.authenticationRequired = false
        
        destructiveNotificationAction.identifier = "conquerWorldAction"
        
        // BEGIN notification_category
        var notificationCategory = UIMutableUserNotificationCategory()
        
        // The name of the category, used by the app to tell different 
        // notifications apart
        notificationCategory.identifier = "com.oreilly.MyApplication.message"
        
        // Set which actions are displayed when a large amount of space is 
        // visible; up to 4 can be provided
        notificationCategory.setActions(
            [notificationAction, destructiveNotificationAction],
            forContext: UIUserNotificationActionContext.Default)
        
        // Set which actions are displayed when not much space is visible; 
        // up to 2 can be provided
        notificationCategory.setActions([notificationAction],
            forContext: UIUserNotificationActionContext.Minimal)
        
        // END notification_category
        
        // BEGIN notification_settings_register_with_actions
        // Create an NSSet containing a single object (the category 
        // we defined above)
        var notificationCategories = NSSet(object: notificationCategory)
        
        // Use that NSSet to create the notification settings
        let notificationSettingsWithAction =
            UIUserNotificationSettings(forTypes: UIUserNotificationType.Alert,
                categories: notificationCategories)
        
        // Register those notification settings
        UIApplication.sharedApplication()
            .registerUserNotificationSettings(notificationSettingsWithAction)
        // END notification_settings_register_with_actions
        
        // BEGIN remote_notification_register
        UIApplication.sharedApplication().registerForRemoteNotifications()
        // END remote_notification_register
        
        // Unregistering for remote notifications
        // BEGIN unregister_notifications
        UIApplication.sharedApplication().unregisterForRemoteNotifications()
        // END unregister_notifications
        return true
        
    }
    
    // BEGIN local_notification_receive_action
    // This function may be called when the app is in the background, if the 
    // action's activation mode was Background
    func application(application: UIApplication!,
        handleActionWithIdentifier identifier: String!,
        forLocalNotification notification: UILocalNotification!,
        completionHandler: (() -> Void)!) {
            
        // Called when the user selects an action from a local notification
        
        println("Received notification \(notification.category)! Action was \(identifier)")
        
        // You must call this block when done dealing with the action, or you'll be terminated
       completionHandler()
        
    }
    // END local_notification_receive_action

    
    // BEGIN local_notification_receive_no_action
    func application(application: UIApplication!,
        didReceiveLocalNotification notification: UILocalNotification!) {
        // Called when the user taps on a local notification (without selecting 
        // an action), or if a local notification arrives while using the app 
        // (in which case the notification isn't shown to the user)
        
        println("Received notification \(notification.category)!")
    }
    // END local_notification_receive_no_action
    
    // BEGIN remote_notification_register_success
    func application(application: UIApplication!,
        didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData!) {
        // Called when we've successfully registered for remote notifications.
        
        // Send the deviceToken to a server you control; it uses that token
        // to send pushes to this specific device.
    }
    // END remote_notification_register_success
    
    // BEGIN remote_notification_register_fail
    func application(application: UIApplication!,
        didFailToRegisterForRemoteNotificationsWithError error: NSError!) {
        // Called when registering for remote notifications doesn't work for some reason
        println("Failed to register for notifications! \(error)")
    }
    // END remote_notification_register_fail
    
    // BEGIN remote_notification_receive_no_action
    func application(application: UIApplication!,
        didReceiveRemoteNotification userInfo: NSDictionary!) {
        // Called when a remote notification arrives, but no action was selected
        // or the notification came in while using the app
            
        // Do something with the information stored in userInfo
    }
    // END remote_notification_receive_no_action
    
    // BEGIN remote_notification_receive_action
    func application(application: UIApplication!,
        handleActionWithIdentifier identifier: String!,
        forRemoteNotification userInfo: NSDictionary!,
        completionHandler: (() -> Void)!) {
        // Called when a remote notification arrives, and the user selected an action
    }
    // END remote_notification_receive_action
    


}
// END multiple-windows
