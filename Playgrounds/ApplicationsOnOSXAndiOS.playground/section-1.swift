// Playground - noun: a place where people can play

import UIKit

// BEGIN bundle_path
let resourcePath = NSBundle.mainBundle()
    .pathForResource("SomeImage", ofType: "png")
// resourcePath is now a string containing the
// absolute path reference to SomeImage.png, or nil
// END bundle_path

// BEGIN bundle_url
let resourceURL = NSBundle.mainBundle()
    .URLForResource("SomeImage", withExtension: "png")
// resourceURL is now an NSURL, or nil
// END bundle_url

// The following is an example of how to request additional time to run in 
// the background, and how to signal to the OS that you're done.

// BEGIN background_task
func applicationDidEnterBackground(application : UIApplication) {
    
    var backgroundTask : UIBackgroundTaskIdentifier! = nil
    
    // Register a background task, and provide a block to run when
    // time runs out
    backgroundTask = application
        .beginBackgroundTaskWithExpirationHandler() {
            
            // This block is called when we're out of time; if we haven't
            // called endBackgroundTask before this block returns,
            // the application is terminated
            
            application.endBackgroundTask(backgroundTask)
            backgroundTask = UIBackgroundTaskInvalid
    }
    
    let backgroundQueue = NSOperationQueue()
    
    backgroundQueue.addOperationWithBlock() {
        
        // Do some work. You have a few minutes to complete it; by the end,
        // you must call endBackgroundTask.
        
        NSLog("Doing some background work!")
        
        application.endBackgroundTask(backgroundTask)
        backgroundTask = UIBackgroundTaskInvalid
    }
    
}
// END background_task



// The following is an example of how to handle the OS telling your app 
// that there's an opportunity to download data in the background.

// BEGIN background_fetch
func application(application: UIApplication,
    performFetchWithCompletionHandler completionHandler:
    (UIBackgroundFetchResult) -> Void) {
        
        // We have 30 seconds to download some data and process it
        
        var error : NSError? = nil
        let data = downloadSomeData(&error)
        
        // Once done, let the OS know whether or not new data was 
        // retrieved or not, or if there was an error
        
        if error != nil {
            completionHandler(UIBackgroundFetchResult.Failed)
            return
        }
        
        // This is a very simple check - your application would 
        // do something more involved, like compare this data against
        // the most recently downloaded data to determine if it's 'new'
        if data?.length > 0 {
            completionHandler(UIBackgroundFetchResult.NewData)
            return
        } else {
            completionHandler(UIBackgroundFetchResult.NoData)
            return
        }
        
        
}
// END background_fetch

// Dummy function used by the previous example
func downloadSomeData(inout error: NSError?) -> NSData? {
    return nil
}