//
//  AppDelegate.swift
//  Localized
//
//  Created by Jon Manning on 30/07/2014.
//  Copyright (c) 2014 Secret Lab. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
                            
    @IBOutlet weak var window: NSWindow!


    @IBOutlet weak var dateLabel: NSTextField!
    
    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        
    /*
    // BEGIN did_finish_launching
    let languageFormat = NSLocalizedString("today's date: %@",
                                    comment:"shows today's date")
        
    self.dateLabel.stringValue = String(format: languageFormat, NSDate())
    // END did_finish_launching
    */
        
        // BEGIN did_finish_launching_with_date
        let languageFormat = NSLocalizedString("today's date: %@",
                                       comment:"shows today's date")
        
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
        
        let dateString = dateFormatter.stringFromDate(NSDate())

        self.dateLabel.stringValue = String(format: languageFormat, dateString)
        // END did_finish_launching_with_date
        
        /*
        // BEGIN date_format_string
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm, MMMM d"
        // END date_format_string
        */
        
        
    }
    

    func applicationWillTerminate(aNotification: NSNotification?) {
        // Insert code here to tear down your application
    }


}

