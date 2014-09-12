// Playground - noun: a place where people can play

import UIKit

class SharingViewController : UIViewController {
    
    @IBAction func shareSomething(sender :AnyObject) {
        
        // BEGIN text-sharing-example
        let text = "Hello, world!"
        let activity = UIActivityViewController(activityItems: [text],
            applicationActivities: nil)
        // END text-sharing-example
        
        // BEGIN displaying-text-sharing
        self.presentViewController(activity, animated: true, completion: nil)
        // END displaying-text-sharing
    }
    
    
}
