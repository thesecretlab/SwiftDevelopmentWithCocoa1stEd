// Playground - noun: a place where people can play

import Cocoa

// BEGIN osx_sharing_setup
var text = "Hello, world!"
var share = NSSharingServicePicker(items: [text])
// END osx_sharing_setup        

var aView = NSView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
// TODO: last param should be an NSRectEdge, not an Int, but API fun times appear to be an issue
// BEGIN osx_sharing_show
share.showRelativeToRect(aView.bounds, ofView: aView, preferredEdge: 2)
// END osx_sharing_show
