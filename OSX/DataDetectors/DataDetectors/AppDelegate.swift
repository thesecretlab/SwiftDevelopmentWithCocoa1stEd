//
//  AppDelegate.swift
//  DataDetectors
//
//  Created by Jon Manning on 31/07/2014.
//  Copyright (c) 2014 Secret Lab. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
                            
    @IBOutlet weak var window: NSWindow!

    @IBOutlet weak var inputTextField: NSTextField!

    @IBOutlet weak var outputTextField: NSTextField!
    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        // Insert code here to initialize your application
    }

    // BEGIN data_detector_code
    @IBAction func check(sender: AnyObject) {
        
        let detector = NSDataDetector(
            types: NSTextCheckingTypes(NSTextCheckingAllTypes), error: nil)
        
        let inputString = self.inputTextField.stringValue
        var resultsText = ""
        
        let matches = detector.matchesInString(inputString, options: nil,
            range: NSMakeRange(0, countElements(inputString!)))
        
        for match in matches {
            
            if let result = match as? NSTextCheckingResult {
                
                switch result.resultType {
                    
                case NSTextCheckingType.Link:
                    resultsText += "Link: \(result.URL)\n"
                    
                case NSTextCheckingType.Date:
                    resultsText += "Date: \(result.date)\n"
                    
                case NSTextCheckingType.PhoneNumber:
                    resultsText += "Phone Number: \(result.phoneNumber)"
                    
                case NSTextCheckingType.Address:
                    resultsText += "Address: \(result.addressComponents)"
                    
                default:
                    resultsText += "Something Else: \(result.description)\n"
                    
                }
            }
        }
        
        self.outputTextField.stringValue = resultsText
        
    }
    // END data_detector_code
    
    func applicationWillTerminate(aNotification: NSNotification?) {
        // Insert code here to tear down your application
    }


}

