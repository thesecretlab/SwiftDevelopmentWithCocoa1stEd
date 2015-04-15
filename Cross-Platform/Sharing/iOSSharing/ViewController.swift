//
//  ViewController.swift
//  iOSSharing
//
//  Created by Jon Manning on 24/06/2014.
//  Copyright (c) 2014 Secret Lab. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
                            
    @IBOutlet var textView: UITextField!
    @IBOutlet var imageView: UIImageView!
    
// BEGIN share-text
@IBAction func shareText(sender: AnyObject) {
    let activity = UIActivityViewController(
        activityItems: [self.textView.text], applicationActivities: nil)
        
    self.presentViewController(activity, animated: true, completion: nil)
}
// END share-text
    
// BEGIN share-image
@IBAction func shareImage(sender: AnyObject) {
        
    if let image = self.imageView?.image {
            
        let activity = UIActivityViewController(
            activityItems: [image], applicationActivities: nil)
            
        self.presentViewController(activity,
            animated: true, completion: nil)
            
    } else {
        // No image to share!
    }
        
}
// END share-image
    
// BEGIN text-field-dismissing
func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return false
}
// END text-field-dismissing


}

