//
//  Note.swift
//  SimpleBindings
//
//  Created by Jon Manning on 7/07/2014.
//  Copyright (c) 2014 Secret Lab. All rights reserved.
//

import Cocoa

// BEGIN note_class
class Note: NSObject {
    
    // Created date is a constant—it's set upon creation, and never changes
    var created : NSDate = NSDate()
    
    // Edited date defaults to the current date
    var edited : NSDate = NSDate()
    
    // Title is a string that, when changed, updates the edited date
    var title : String = "New Note" {
    didSet {
        edited = NSDate()
    }
    }
    
    // Text is an NSAttributed string that does a similar thing
    var text : NSAttributedString = NSAttributedString(string: "New Note") {
    didSet {
        edited = NSDate()
    }
    }
    
}
// END note_class
