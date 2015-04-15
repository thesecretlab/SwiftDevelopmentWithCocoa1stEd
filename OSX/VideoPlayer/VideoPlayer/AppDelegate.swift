//
//  AppDelegate.swift
//  VideoPlayer
//
//  Created by Timothy Rodney Nugent on 26/08/2014.
//  Copyright (c) 2014 Timothy Rodney Nugent. All rights reserved.
//

import Cocoa
// ------
// importing the frameworks
// BEGIN video_import
import AVFoundation
import QuartzCore
// END video_import

class AppDelegate: NSObject, NSApplicationDelegate {
                            
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var playerView: NSView!
// ------
// adding a var to hold the player
// BEGIN video_var
var player: AVPlayer?
// END video_var

// ------
// adding the player content to the view
// BEGIN video_setup
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        let contentURL = NSBundle.mainBundle().URLForResource("TestVideo",
            withExtension: "m4v")
        player = AVPlayer(URL: contentURL)
        
        var playerLayer = AVPlayerLayer(player: player)
        self.playerView.layer?.addSublayer(playerLayer)
        playerLayer.frame = self.playerView.bounds
        playerLayer.autoresizingMask =
            CAAutoresizingMask.LayerHeightSizable |
            CAAutoresizingMask.LayerWidthSizable
        
        self.player!.actionAtItemEnd = AVPlayerActionAtItemEnd.None
// END video_setup
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
// ------
// video functions
// BEGIN video_funcs
    @IBAction func play(sender: AnyObject) {
        self.player!.play()
    }
    @IBAction func playSlowMotion(sender: AnyObject) {
        self.player!.rate = 0.25
    }
    @IBAction func rewind(sender: AnyObject) {
        self.player!.seekToTime(kCMTimeZero)
    }
// END video_funcs
}

