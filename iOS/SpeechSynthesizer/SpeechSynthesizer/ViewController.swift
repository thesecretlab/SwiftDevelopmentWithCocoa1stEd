//
//  ViewController.swift
//  SpeechSynthesizer
//
//  Created by Timothy Rodney Nugent on 26/08/2014.
//  Copyright (c) 2014 Timothy Rodney Nugent. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func speak(sender: AnyObject) {
// ------
// Creating and demoing a speech synthesizer
// BEGIN speech_synth
        // creating a synthesizer
        var synthesizer = AVSpeechSynthesizer()
        
        // creating an utterance to synthesize
        let utteranceString = "I am the very model of a modern major general"
        var utterance = AVSpeechUtterance(string: utteranceString)
        // setting a rate to speak at
        utterance.rate = 0.175
        
        // synthesizing and speaking the utterance
        synthesizer.speakUtterance(utterance)
// END speech_synth
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

