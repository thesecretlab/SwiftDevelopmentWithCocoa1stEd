//
//  Document.swift
//  CocoaDocuments
//
//  Created by Jon Manning on 7/08/2014.
//  Copyright (c) 2014 Secret Lab. All rights reserved.
//

import Cocoa

class Document: NSDocument {
                            
    @IBOutlet weak var textField: NSTextField!
    
    @IBOutlet weak var checkbox: NSButton!
    
    // BEGIN osx_documents_text_prop
    var text = ""
    // END osx_documents_text_prop
    
    var checked = false
    
    
    override init() {
        super.init()
        // Add your subclass-specific initialization here.
                                    
    }

    

    override class func autosavesInPlace() -> Bool {
        return true
    }

    override var windowNibName: String {
        // Returns the nib file name of the document
        // If you need to use a subclass of NSWindowController or if 
        // your document supports multiple NSWindowControllers, you should 
        // remove this property and override -makeWindowControllers instead.
        return "Document"
    }
    
    /*
    // BEGIN osx_documents_loading
    override func windowControllerDidLoadNib(aController: NSWindowController) {
        
        // The window has loaded, and is ready to display. 
        // Take the text that we loaded earlier and display 
        // it in the text field
        super.windowControllerDidLoadNib(aController)
        
        self.textField.stringValue = self.text
    }

    override func dataOfType(typeName: String?, 
        error outError: NSErrorPointer) -> NSData? {
        
        // Convert the contents of the text field into data,
        // and return it
        self.text = self.textField.stringValue
        
        return self.text.dataUsingEncoding(NSUTF8StringEncoding,
            allowLossyConversion: false)
    }

    override func readFromData(data: NSData?, ofType typeName: String?, 
        error outError: NSErrorPointer) -> Bool {
        
        // Attempt to load a string from the data; if it works, store it 
        // in self.text
        if data?.length > 0 {
            let string = NSString(data: data, encoding: NSUTF8StringEncoding)
            self.text = string
        } else {
            self.text = ""
        }
        
        return true
    }
    // END osx_documents_loading
    */

    // BEGIN osx_documents_loading_advanced
    override func windowControllerDidLoadNib(aController: NSWindowController) {
        
        // The window has loaded, and is ready to display.
        // Take the text that we loaded earlier and display
        // it in the text field
        super.windowControllerDidLoadNib(aController)
        
        self.textField.stringValue = self.text
        self.checkbox.integerValue = Int(self.checked)
    }
    
    override func dataOfType(typeName: String?,
        error outError: NSErrorPointer) -> NSData? {
        
        self.text = self.textField.stringValue
        self.checked = Bool(self.checkbox.integerValue)
        
        let dictionary = ["checked": self.checked,
                          "text": self.text]
        
        var error : NSError? = nil
        
        let serializedData = NSJSONSerialization.dataWithJSONObject(dictionary,
            options: NSJSONWritingOptions.PrettyPrinted, error: &error)
        
        if serializedData == nil || error != nil {
            
            outError.memory = error
            
            return nil;
        } else {
            return serializedData
        }
        
    }
    
    override func readFromData(data: NSData, ofType typeName: String?,
        error outError: NSErrorPointer) -> Bool {
        
        var error : NSError? = nil
        
        let data = NSJSONSerialization.JSONObjectWithData(data,
            options: NSJSONReadingOptions(), error: &error) as? NSDictionary
        
        if data == nil || error != nil {
            outError.memory = error
            return false
        }
        
        if let text = data!["text"] as? String {
            self.text = text
        }
        
        if let checked = data!["checked"] as? Bool {
            self.checked = checked
        }
        
        return true
    }
    // END osx_documents_loading_advanced



}

