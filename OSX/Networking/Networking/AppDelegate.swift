//
//  AppDelegate.swift
//  Networking
//
//  Created by Jon Manning on 1/07/2014.
//  Copyright (c) 2014 Secret Lab. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
                            
    @IBOutlet var window: NSWindow!

    @IBOutlet var imageView: NSImageView!
    
    // BEGIN using_nsurlsession
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        
        // PlaceKitten.com URLs work like this:
        // http://placekitten.com/<width>/<height>
        
        let width = self.imageView.bounds.size.width
        let height = self.imageView.bounds.size.height
        
        let urlString = "http://placekitten.com/\(Int(width))/\(Int(height))"
        
        if let url = NSURL(string:urlString) {
            
            // Using this URL, make an NSURLSesssion and then create a data 
            // request task.
            let session = NSURLSession(
                configuration: NSURLSessionConfiguration
                               .defaultSessionConfiguration())
            
            let dataTask = session.dataTaskWithURL(url) {
                (data: NSData?,
                response: NSURLResponse?,
                error: NSError?) in
                
                if data == nil {
                    self.imageView.image = nil
                } else {
                    if let image = NSImage(data: data!) {
                        self.imageView.image = image;
                    }
                }
                
                
            }
            
            // Call resume() on the data request to start it
            dataTask.resume()
        }
    }
    // END using_nsurlsession
   
    


}

