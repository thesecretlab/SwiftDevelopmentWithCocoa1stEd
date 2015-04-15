//
//  AppDelegate.swift
//  AVAudioPlayer
//
//  Created by Timothy Rodney Nugent on 26/08/2014.
//  Copyright (c) 2014 Timothy Rodney Nugent. All rights reserved.
//

import Cocoa
import AVFoundation

class AppDelegate: NSObject, NSApplicationDelegate {
                            
    @IBOutlet weak var window: NSWindow!
    var audioPlayer = AVAudioPlayer()

    func applicationDidFinishLaunching(aNotification: NSNotification) {
// ------
// setting up the audio player
// BEGIN audio_setup
        let soundFileURL = NSBundle.mainBundle().URLForResource("TestSound",
                                                        withExtension: "wav")
        var error: NSError?
        audioPlayer = AVAudioPlayer(contentsOfURL: soundFileURL, error: &error)
// END audio_setup

// ------
// configuring the player
// BEGIN audio_config
        audioPlayer.volume = 0.5
        audioPlayer.numberOfLoops = -1
// END audio_config
        
// ------
// setting the seek time
// BEGIN audio_seek
        audioPlayer.currentTime = 0
// END audio_seek

// ------
// playing the audio
// BEGIN audio_play
        audioPlayer.play()
// END audio_play
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

