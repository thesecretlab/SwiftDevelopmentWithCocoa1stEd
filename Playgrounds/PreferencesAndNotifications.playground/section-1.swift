// Playground - noun: a place where people can play

import UIKit

// BEGIN registering_for_notification
// Get the notification center to use (in this and almost all
// cases, use the default center)
let notificationCenter = NSNotificationCenter.defaultCenter()

// Get the operation queue to run the notification handler on
// (in this case, the main operation queue)
let operationQueue = NSOperationQueue.mainQueue()

// Register for the notification UIApplicationDidEnterBackgroundNotification
let applicationDidEnterBackgroundObserver = 
    notificationCenter.addObserverForName(
        UIApplicationDidEnterBackgroundNotification, 
        object: nil, queue: operationQueue) {
    
    (notification: NSNotification!) in
    
    println("Hello!")
}
// END registering_for_notification


// BEGIN posting_notification
let MyNotificationType = "MyNotificationType"

// the 'object' parameter is the object responsible for sending the 
// notification, and can be nil
notificationCenter.postNotificationName(MyNotificationType, object: nil)
// END posting_notification

// BEGIN unregistering_for_notification
notificationCenter.removeObserver(applicationDidEnterBackgroundObserver)
// END unregistering_for_notification


// BEGIN user_defaults
let defaults = NSUserDefaults.standardUserDefaults()
// END user_defaults

// BEGIN registering_defaults
// Create the default values dictionary
let myDefaults = [
    "greeting": "hello",
    "numberOfItems": 1
]

// Provide this dictionary to the defaults object
defaults.registerDefaults(myDefaults)
// END registering_defaults

// BEGIN retrieving_default
// Retrieve a string with the key "greeting" from the defaults object
let greeting = defaults.objectForKey("greeting") as? String
// END retrieving_default

// BEGIN setting_default
let newGreeting = "hi there"
defaults.setObject(newGreeting, forKey: "greeting")
// END setting_default


