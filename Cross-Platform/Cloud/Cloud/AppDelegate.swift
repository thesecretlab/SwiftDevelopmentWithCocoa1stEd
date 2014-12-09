//
//  AppDelegate.swift
//  Cloud
//
//  Created by Jon Manning on 8/08/2014.
//  Copyright (c) 2014 Secret Lab. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    
    // BEGIN ubiq_kvs_property
    var cloudString : String? {
        get {
            return NSUbiquitousKeyValueStore
                .defaultStore()
                .stringForKey("cloud_string")
        }
        set {
            NSUbiquitousKeyValueStore.defaultStore()
                .setString(newValue, forKey: "cloud_string")
            NSUbiquitousKeyValueStore.defaultStore().synchronize()
        }
    }
    // END ubiq_kvs_property
    
    // BEGIN ubiq_files_property
    dynamic var filesInCloudStorage : [NSURL] = []
    // END ubiq_files_property
    
    // BEGIN ubiq_kvs_change_observer_property
    var storeChangeObserver : AnyObject? = nil
    // END ubiq_kvs_change_observer_property
    
    
    // BEGIN metadata_query_prop
    var metadataQuery : NSMetadataQuery!
    var metadataQueryDidUpdateObserver : AnyObject?
    var metadataQueryDidFinishGatheringObserver : AnyObject?
    // END metadata_query_prop
    
    
    @IBOutlet weak var window: NSWindow!

    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        
        // BEGIN icloud_ubiquitycontainer
        // We run this on a new background queue because it might take some time
        // for the app to determine this URL
        
        let backgroundQueue = NSOperationQueue()
        
        backgroundQueue.addOperationWithBlock() {
            // Pass 'nil' to this method to get the URL for the first iCloud
            // container listed in the app's entitlements
            let ubiquityContainerURL = NSFileManager.defaultManager()
                .URLForUbiquityContainerIdentifier(nil)
            
            println("Ubiquity container URL: \(ubiquityContainerURL)")
        }
        // END icloud_ubiquitycontainer
        
// BEGIN ubiq_kvs_change_observer_registering
storeChangeObserver =
NSNotificationCenter.defaultCenter()
    .addObserverForName(
        NSUbiquitousKeyValueStoreDidChangeExternallyNotification,
        object: self,
        queue: NSOperationQueue.mainQueue()) {
    (notification) in
    self.willChangeValueForKey("cloudString")
    self.didChangeValueForKey("cloudString")
}
// END ubiq_kvs_change_observer_registering
        
       
// BEGIN metadata_query
metadataQuery = NSMetadataQuery()
metadataQuery.searchScopes =
    [NSMetadataQueryUbiquitousDocumentsScope]
metadataQuery.predicate =
    NSPredicate(format: "%K LIKE '*'", NSMetadataItemFSNameKey)
        
self.metadataQueryDidUpdateObserver =
    NSNotificationCenter.defaultCenter()
        .addObserverForName(NSMetadataQueryDidUpdateNotification,
            object: nil, queue: NSOperationQueue.mainQueue()) {
            
    (notification) in
    self.queryDidUpdate()
}
        
self.metadataQueryDidFinishGatheringObserver =
    NSNotificationCenter.defaultCenter()
        .addObserverForName(NSMetadataQueryDidFinishGatheringNotification,
            object: nil, queue: NSOperationQueue.mainQueue()) {
            
    (notification) in
    self.queryDidUpdate()
}
        
metadataQuery.startQuery()
// END metadata_query

        
    }
    
    // BEGIN metadata_query_did_update
    func queryDidUpdate() {
        var urls : [NSURL] = []
        
        for item in metadataQuery.results  {
            
            if let metadataItem = item as? NSMetadataItem {
                let url =
                    metadataItem
                        .valueForAttribute(NSMetadataItemURLKey) as NSURL
                urls.append(url)
            }
            
        }
        
        self.filesInCloudStorage = urls
    }
    // END metadata_query_did_update
    
    
    // BEGIN ubiq_add_file
    @IBAction func addFile(sender : AnyObject?) {
        let panel = NSOpenPanel()
        panel.beginSheetModalForWindow(self.window) {
            
            (result) in
            
            if (result == NSOKButton) {
                let containerURL = NSFileManager.defaultManager()
                    .URLForUbiquityContainerIdentifier(nil)?
                    .URLByAppendingPathComponent("Documents", 
                                                  isDirectory: true)
                
                if let sourceURL = panel.URL {
                    let destinationURL = containerURL?
                        .URLByAppendingPathComponent(
                            sourceURL.lastPathComponent)
                    
                    var error : NSError?
                    
                    // Move the file into iCloud (AKA "ubiquitous storage")
                    NSFileManager.defaultManager().setUbiquitous(true,
                        itemAtURL: sourceURL,
                        destinationURL: destinationURL!,
                        error: &error)
                    
                    if error != nil {
                        println("Couldn't make the file ubiqitous: \(error)")
                    }
                }
                
            }
            
        }
        
    }
    // END ubiq_add_file

    func applicationWillTerminate(aNotification: NSNotification?) {
        // Insert code here to tear down your application
    }


}

