//
//  AppDelegate.swift
//  iTunesDetector
//
//  Created by Jon Manning on 1/07/2014.
//  Copyright (c) 2014 Secret Lab. All rights reserved.
//

// BEGIN net_services
import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate, NSNetServiceDelegate,
    NSNetServiceBrowserDelegate {
                            
    @IBOutlet var window: NSWindow!
    
    let browser = NSNetServiceBrowser()
    var services = [NSNetService]()

    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        
        browser.delegate = self;
        
        // Search for DAAP services that use TCP, in the default domains
        browser.searchForServicesOfType("_daap._tcp", inDomain:"")
        
    }
    
    func netServiceBrowser(aNetServiceBrowser: NSNetServiceBrowser,
        didFindService aNetService: NSNetService, moreComing: Bool) {
        
        services.append(aNetService)
        
        println("Found a service: \(aNetService)")
        
        aNetService.delegate = self
        aNetService.resolveWithTimeout(5.0)
    }
    
    func netServiceBrowser(aNetServiceBrowser: NSNetServiceBrowser,
        didRemoveService aNetService: NSNetService, moreComing: Bool) {
        
        services = services.filter({ $0 != aNetService})
        
        println("A service was removed: \(aNetService)")
        
    }
    
    func netServiceDidResolveAddress(sender: NSNetService) {
        let serviceURL = NSURL(string:"http://\(sender.hostName):\(sender.port)")
        
        println("Resolved address for service \(sender): \(serviceURL)")
    }
    
    func netService(sender: NSNetService,
                            didNotResolve errorDict: NSDictionary) {
        println("Couldn't resolve address for service \(sender), \(errorDict)")
    }
}
// END net_services


