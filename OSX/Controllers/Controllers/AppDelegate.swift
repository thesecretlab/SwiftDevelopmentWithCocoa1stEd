//
//  AppDelegate.swift
//  Controllers
//
//  Created by Timothy Rodney Nugent on 25/08/2014.
//  Copyright (c) 2014 Timothy Rodney Nugent. All rights reserved.
//

import Cocoa
import GameController

class AppDelegate: NSObject, NSApplicationDelegate {
                            
    @IBOutlet weak var window: NSWindow!
    
    var myController = GCController()

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
// ------
// controller input handling
// BEGIN controller_input
        var controllers = GCController.controllers()
        
        if (controllers.count != 0)
        {
            // grabbing a reference to the first controller
            self.myController = controllers[0] as! GCController
            
            // un-set the player number
            self.myController.playerIndex = GCControllerPlayerIndexUnset
            
            if ((self.myController.extendedGamepad) != nil)
            {
                NSLog("This is an extended controller")
                // adding a callback handler for when a value has changed
                var profile = self.myController.extendedGamepad
                profile.valueChangedHandler =
                    {(  gamepad: GCExtendedGamepad!,
                        element:GCControllerElement!) -> Void in
                        if (element == gamepad.rightTrigger)
                        {
                            if (gamepad.rightTrigger.pressed)
                            {
                                NSLog("Right trigger pressed")
                            }
                        }
                }
                profile.leftTrigger.valueChangedHandler =
                    {(  input:GCControllerButtonInput!,
                        value:Float,
                      pressed:Bool) -> Void in
                        if(pressed == true)
                        {
                            NSLog("left trigger pressed")
                        }
                }
            }
            else
            {
                NSLog("controller is a simple controller")
            }
        }
        else
        {
            NSLog("There are no controllers connected")
        }
// END controller_input
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

