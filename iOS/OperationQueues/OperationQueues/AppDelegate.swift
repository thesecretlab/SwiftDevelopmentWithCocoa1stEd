//
//  AppDelegate.swift
//  OperationQueues
//
//  Created by Jon Manning on 30/06/2014.
//  Copyright (c) 2014 Secret Lab. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?


    // BEGIN background_process
    
    var backgroundTask : UIBackgroundTaskIdentifier?
    
    func applicationDidEnterBackground(application: UIApplication) {
        
        // Register a background task. This keeps the app from being
        // terminated until we tell the system that the task is complete.
        
        self.backgroundTask =
                    application.beginBackgroundTaskWithExpirationHandler {
                        () -> Void in
                        
                        // When this method is run, we're out of time.
                        // Clean up, and then run endBackgroundTask.
                        
                        application.endBackgroundTask(self.backgroundTask!)
                        
        }
        
        // Make a new background queue to run our background code on.
        var backgroundQueue = NSOperationQueue()
        
        backgroundQueue.addOperationWithBlock() {
            // Send a request to the server.
            
            // Prepare the URL
            var notificationURL = NSURL(string: "http://www.oreilly.com/")
            
            // Prepare the URL request
            var notificationURLRequest = NSURLRequest(URL: notificationURL)
            
            // Send the request, and log the reply
            var loadedData =
                NSURLConnection.sendSynchronousRequest(notificationURLRequest,
                                        returningResponse: nil,
                                        error: nil)
            
            if let theData = loadedData {
                // Convert the data to a string
                var loadedString = NSString(data: theData,
                                        encoding: NSUTF8StringEncoding)
                
                println("Loaded: %@", String(format: loadedString))
                
            }
            
            
            // Signal to the system that we're done working in the background
            application.endBackgroundTask(self.backgroundTask!)
        }
        
    }
    // END background_process



}

