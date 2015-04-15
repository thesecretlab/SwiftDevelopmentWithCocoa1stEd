//
//  ViewController.swift
//  AVKit-iOS
//
//  Created by Timothy Rodney Nugent on 3/10/2014.
//  Copyright (c) 2014 Timothy Rodney Nugent. All rights reserved.
//

import UIKit
// BEGIN avkit_ios_frameworks
import AVKit
import AVFoundation
// END avkit_ios_frameworks

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

// BEGIN avkit_ios_config
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
{
    if segue.identifier == "videoSegue"
    {
        // set up the player
        let videoURL = NSBundle.mainBundle().URLForResource("TestVideo",
                                                       withExtension: "m4v")
        let videoViewController =
                   segue.destinationViewController as! AVPlayerViewController
        videoViewController.player = AVPlayer(URL: videoURL)
    }
}
// END avkit_ios_config

}

