//
//  ViewController.swift
//  Cloud-iOS
//
//  Created by Jon Manning on 8/08/2014.
//  Copyright (c) 2014 Secret Lab. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate,
                                        UIDocumentPickerDelegate {
    
    // BEGIN ios_ukvs_change_observer
    var keyValueStoreDidChangeObserver : AnyObject?
    // END ios_ukvs_change_observer
    
    // BEGIN ios_metadataquery_props
    var queryDidFinishGatheringObserver : AnyObject?
    var queryDidUpdateObserver: AnyObject?
    var metadataQuery : NSMetadataQuery!
    // END ios_metadataquery_props
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var fileList: UITextView!
    
    // BEGIN document_selector_prop
    var documentSelector : UIDocumentPickerViewController?
    // END document_selector_prop
    
    // BEGIN ios_selectfile
    @IBAction func selectFile(sender: UIButton) {
        
        // We want to select any file; 'public.data' means 'any data'
        documentSelector = UIDocumentPickerViewController(documentTypes:
            ["public.data"],
            inMode: UIDocumentPickerMode.Import)
        documentSelector?.delegate = self
        
        // Show the picker
        self.presentViewController(documentSelector!,
                                            animated: true,
                                          completion: nil)
        
    }
    // END ios_selectfile
    
    // BEGIN ios_document_picker_selected
    func documentPicker(controller: UIDocumentPickerViewController,
        didPickDocumentAtURL url: NSURL) {
        
        // This picker was set up to use the UIDocumentPickerMode.Import mode
        // That means that 'url' points to a temporary file that we can move 
        // into our container
        
        // Let the system know that we're about to start using this—it might
        // be in some other app's container, which means we need to get the 
        // system to temporarily unlock it
        url.startAccessingSecurityScopedResource()
        
        let fileName = url.lastPathComponent
        
        // Copy it to a temporary location
            let temporaryURL = NSURL.fileURLWithPath(NSTemporaryDirectory(),
                                                             isDirectory:true)?
            .URLByAppendingPathComponent(fileName!)
        
        var copyError : NSError? = nil
        
        NSFileManager.defaultManager().copyItemAtURL(url,
            toURL: temporaryURL!, error: &copyError)
        
        if let theError = copyError {
            println("Error copying: \(theError)")
        }
        
        // We're done—let the system know that we don't
        // need access permission anymore
        url.stopAccessingSecurityScopedResource()
        
        // Now, move that item into ubiquitous storage
        
        let destinationURL = NSFileManager.defaultManager()
            .URLForUbiquityContainerIdentifier(nil)?
            .URLByAppendingPathComponent("Documents")
            .URLByAppendingPathComponent(fileName!)
        
        var makeUbiquitousError : NSError? = nil
        
        NSFileManager.defaultManager().setUbiquitous(true,
            itemAtURL: temporaryURL!,
            destinationURL: destinationURL!,
            error: &makeUbiquitousError)
        
        if let theError = makeUbiquitousError {
            println("Error making ubiquitous: \(theError)")
        }
        
        // Finally, dismiss the view controller
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func documentPickerWasCancelled(controller: UIDocumentPickerViewController)
    {
        // Nothing got selected, so just dismiss it
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    // END ios_document_picker_selected
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // BEGIN ios_ubiq_viewdidload
        self.textField.text =
           NSUbiquitousKeyValueStore.defaultStore()
           .stringForKey("cloud_string")
        
        keyValueStoreDidChangeObserver = NSNotificationCenter.defaultCenter()
            .addObserverForName(
                NSUbiquitousKeyValueStoreDidChangeExternallyNotification,
                object: nil, queue: NSOperationQueue.mainQueue()) {
            
            (notification) in
            
            self.textField.text =
                NSUbiquitousKeyValueStore.defaultStore()
                    .stringForKey("cloud_string")
            
        }
        // END ios_ubiq_viewdidload
        
    // BEGIN ios_metadata_query_setup
    metadataQuery = NSMetadataQuery()
    metadataQuery.searchScopes =
        [NSMetadataQueryUbiquitousDocumentsScope]
    metadataQuery.predicate = NSPredicate(format: "%K LIKE '*'",
                                                NSMetadataItemFSNameKey)
        
    queryDidUpdateObserver = NSNotificationCenter.defaultCenter()
        .addObserverForName(NSMetadataQueryDidUpdateNotification,
            object: metadataQuery,
            queue: NSOperationQueue.mainQueue()) {
        (notification) in
            
        self.queryUpdated()
    }
        
    queryDidFinishGatheringObserver = NSNotificationCenter.defaultCenter()
        .addObserverForName(NSMetadataQueryDidFinishGatheringNotification,
            object: metadataQuery,
            queue: NSOperationQueue.mainQueue()) {
        (notification) in
            
        self.queryUpdated()
    }
        
    metadataQuery.startQuery()
        
    self.fileList.text = ""
    // END ios_metadata_query_setup
        
    }
    
    // BEGIN ios_metadata_query_updated
    func queryUpdated() {
        
        var files : [NSURL] = []
        
        for item in metadataQuery.results {
            if let metadataItem = item as? NSMetadataItem {
                let url =
                    metadataItem
                        .valueForAttribute(NSMetadataItemURLKey) as! NSURL
                files.append(url)
                
                
                
            }
        }
        
        self.fileList.text = files.description
        
    }
    // END ios_metadata_query_updated
    
    // BEGIN ios_ubiq_kvm_textfield_return
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.textField.resignFirstResponder()
        NSUbiquitousKeyValueStore.defaultStore(
        ).setString(self.textField.text,
            forKey: "cloud_string")
        return false;
    }
    // END ios_ubiq_kvm_textfield_return


}

