//
//  ViewController.swift
//  DocumentPicker
//
//  Created by Jon Manning on 29/07/2014.
//  Copyright (c) 2014 Secret Lab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func putDocumentInCloud(sender: AnyObject) {
        
        let string = "Hello!"
        let data = string.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
        
        let containerURL = NSFileManager.defaultManager().URLForUbiquityContainerIdentifier(nil)
        let documentsURL = containerURL?.URLByAppendingPathComponent("Documents")
        
        let sourceURL = NSURL.fileURLWithPath(NSTemporaryDirectory().stringByAppendingPathComponent("TempFile.txt"))
        
        data?.writeToURL(sourceURL!, atomically: true)
        
        let destinationURL = documentsURL?.URLByAppendingPathComponent("TempFile.txt")
        
        NSFileManager.defaultManager().setUbiquitous(true, itemAtURL: sourceURL!, destinationURL: destinationURL!, error: nil)
        
        
    }
                            
    @IBAction func openDocument(sender: AnyObject) {
        
        // We want to open plain text files ('.txt')
        let documentTypes = ["public.content"]
        
        let documentPicker = UIDocumentPickerViewController(documentTypes: documentTypes, inMode: UIDocumentPickerMode.Import)
        
        let documentProviderPicker = UIDocumentMenuViewController(documentTypes: documentTypes, inMode: UIDocumentPickerMode.Import)
        
        self.presentViewController(documentProviderPicker, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

