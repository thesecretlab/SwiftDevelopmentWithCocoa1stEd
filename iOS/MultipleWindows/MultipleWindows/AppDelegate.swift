//
//  AppDelegate.swift
//  MultipleWindows
//
//  Created by Jon Manning on 23/06/2014.
//  Copyright (c) 2014 Secret Lab. All rights reserved.
//

// BEGIN multiple-windows
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window : UIWindow!
    var secondWindow : UIWindow!
    
    func application(application: UIApplication!,
        didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool {
        
        // Register to be notified of when screens connect or disconnect
        var notificationCenter = NSNotificationCenter.defaultCenter()
        
        notificationCenter.addObserver(self,
            selector: Selector("screenDidConnect:"),
            name: UIScreenDidConnectNotification,
            object: nil)
        notificationCenter.addObserver(self,
            selector: Selector("screenDidDisconnect:"),
            name: UIScreenDidDisconnectNotification,
            object: nil)
        
        // We're in the middle of starting up. If the system already has
        // multiple screens, set up the second one!
        if UIScreen.screens().count >= 2 {
            var secondScreen = UIScreen.screens()[1] as UIScreen
            self.setupScreen(secondScreen)
        }
        
        return true
    }
    
    // Given a screen, prepare and display the view
    // controller for the screen.
    func setupScreen(screen : UIScreen) {
        
        // If we already have a second window, do nothing
        if self.secondWindow != nil {
            return;
        }
        
        // Create a window to display on this screen
        self.secondWindow = UIWindow(frame: screen.bounds)
        self.secondWindow.screen = screen
        self.secondWindow.hidden = false
        
        // Create a view controller to show in the window
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        var viewController = storyboard
            .instantiateViewControllerWithIdentifier("secondWindowVC")
                as UIViewController
        
        // Show the view controller in the window
        self.secondWindow.rootViewController = viewController
    
    }
    
    // Called when a screen connects
    func screenDidConnect(notification: NSNotification) {
        
        // Get the screen from the NSObject
        var screen = notification.object as UIScreen
        
        // Attempt to set it up
        self.setupScreen(screen)
    }
    
    // Called when a screen disconnects
    func screenDidDisconnect(notification: NSNotification) {
        
        // Get the screen from the NSObject
        var screen = notification.object as UIScreen
        
        // If we have a second window, and it uses this window...
        if self.secondWindow?.screen == screen {
            
            // ... remove it!
            self.secondWindow = nil
        }
        
    }

}
// END multiple-windows
