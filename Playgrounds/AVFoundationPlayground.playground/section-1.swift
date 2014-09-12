// Playground - noun: a place where people can play

import UIKit
import AVFoundation

"/Users/McJones/Development/Orallyman Code/TestVideo.m4v"

// ------
// loading content into player
// BEGIN av_loading
let contentURL = NSURL(fileURLWithPath:"/location/to/AVFile.m4v")
let player = AVPlayer(URL: contentURL)
// END av_loading

// ------
// adding the player to a layer
// BEGIN av_layer
var playerLayer = AVPlayerLayer(player: player)
// END av_layer

// ------
// adding the layer to a view
// BEGIN av_view
var view = UIView(frame: CGRectMake(0, 0, 640, 360))
playerLayer.frame = view.bounds
view.layer.addSublayer(playerLayer)
// END av_view

// ------
// playing content
// BEGIN av_playing
player.play()
// END av_playing
