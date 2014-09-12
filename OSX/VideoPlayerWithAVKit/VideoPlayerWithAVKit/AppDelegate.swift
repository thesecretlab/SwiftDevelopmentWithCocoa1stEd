//
//  AppDelegate.swift
//  VideoPlayerWithAVKit
//
//  Created by Timothy Rodney Nugent on 26/08/2014.
//  Copyright (c) 2014 Timothy Rodney Nugent. All rights reserved.
//

import Cocoa
import AVFoundation
// ------
// importing AVKit
// BEGIN avkit_import
import AVKit
// END avkit_import

class AppDelegate: NSObject, NSApplicationDelegate {
                            
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var playerView: AVPlayerView!

// ------
// importing AVKit
// BEGIN avkit_setup
    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        let contentURL = NSBundle.mainBundle().URLForResource("TestVideo",
            withExtension: "m4v")
        
        self.playerView.player = AVPlayer(URL: contentURL)
    }
// END avkit_setup

    func applicationWillTerminate(aNotification: NSNotification?) {
        // Insert code here to tear down your application
    }


}

