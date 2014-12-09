//
//  SampleDocument.swift
//  iOSDocuments
//
//  Created by Jon Manning on 7/08/2014.
//  Copyright (c) 2014 Secret Lab. All rights reserved.
//

// BEGIN ios_document_class
import UIKit

class SampleDocument: UIDocument {
    
    var text = ""

    // Called when a document is opened.
    override func loadFromContents(contents: AnyObject,
        ofType typeName: String, error outError: NSErrorPointer) -> Bool {
        
        self.text = ""
        
        if let data = contents as? NSData {
            
            if data.length > 0 {
                // Attempt to decode the data into text; if it's successful
                // store it in self.text
                if let theText =
                    NSString(data: data, encoding: NSUTF8StringEncoding) {
                        self.text = theText
                }
            }
            
        }
        
        return true
        
    }
    
    // Called when the system needs a snapshot of the current state of
    // the document, for autosaving.
    override func contentsForType(typeName: String,
        error outError: NSErrorPointer) -> AnyObject? {
        
        return self.text.dataUsingEncoding(NSUTF8StringEncoding)
        
    }
   
}
// END ios_document_class
