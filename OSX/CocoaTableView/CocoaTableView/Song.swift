//
//  Song.swift
//  CocoaTableView
//
//  Created by Jon Manning on 6/08/2014.
//  Copyright (c) 2014 Secret Lab. All rights reserved.
//

import Cocoa

// BEGIN osx_tableview_model
class Song: NSObject {

    var title : String = "A Song"
    var duration : NSTimeInterval = 0.0
    
}
// END osx_tableview_model

extension Song {
    
    // BEGIN osx_tableview_durationstring
    func durationString() -> String {
        return String(format: "%i:%02i", Int(self.duration) / 60,
                            Int(self.duration) % 60)
    }
    // END osx_tableview_durationstring

}
