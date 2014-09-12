//
//  AppDelegate.swift
//  CocoaTableView
//
//  Created by Jon Manning on 6/08/2014.
//  Copyright (c) 2014 Secret Lab. All rights reserved.
//

import Cocoa

// BEGIN osx_tableview_protocols
class AppDelegate: NSObject, NSApplicationDelegate,
                   NSTableViewDelegate, NSTableViewDataSource {
// END osx_tableview_protocols

    
    @IBOutlet weak var window: NSWindow!
    
    // BEGIN osx_tableviews_properties
    var songs : [Song] = []
    @IBOutlet var songsController: NSArrayController!
    // END osx_tableviews_properties
    
    // BEGIN osx_tableviews_setup
    override func awakeFromNib() {
        var aSong : Song!
        
        aSong = Song()
        aSong.title = "Gaeta's Lament"
        aSong.duration = 289
        
        self.songsController.addObject(aSong)
        
        aSong = Song()
        aSong.title = "The Signal";
        aSong.duration = 309
        
        self.songsController.addObject(aSong)
        
        aSong = Song()
        aSong.title = "Resurrection Hub";
        aSong.duration = 221
        
        self.songsController.addObject(aSong)
        
        aSong = Song()
        aSong.title = "The Cult of Baltar";
        aSong.duration = 342
        
        self.songsController.addObject(aSong)
    }
    // END osx_tableviews_setup
    
    // BEGIN osx_tableview_rows
    func numberOfRowsInTableView(tableView: NSTableView!) -> Int {
        return self.songs.count
    }
    // END osx_tableview_rows
    
    // BEGIN osx_tableview_cells
    func tableView(tableView: NSTableView!, viewForTableColumn
                 tableColumn: NSTableColumn!, row: Int) -> NSView!  {
        
        var textField : NSTextField! =
                    tableView.makeViewWithIdentifier("TextField",
                        owner: self) as? NSTextField
        
        let song = self.songs[row]
        
        if textField == nil {
            textField = NSTextField(frame: NSZeroRect)
            textField.bordered = false
            textField.editable = false
            textField.drawsBackground = false
            textField.identifier = "TextField"
        }
        
        if tableColumn.identifier == "Title" {
            textField.stringValue = song.title
        } else if tableColumn.identifier == "Duration" {
            let durationText = NSString(format: "%i:%02i", Int(song.duration)
                                                  / 60, Int(song.duration) % 60)
            textField.stringValue = durationText
        }
        
        return textField;
    }
    // END osx_tableview_cells
    
    // BEGIN osx_tableview_sorting
    func tableView(tableView: NSTableView!,
                    sortDescriptorsDidChange oldDescriptors: [AnyObject]!)  {
        var songsAsMutableArray = NSMutableArray(array: songs)
        songsAsMutableArray.sortUsingDescriptors(tableView.sortDescriptors)
        
        for sortDescriptor in tableView.sortDescriptors.reverse()
            as [NSSortDescriptor] {
            songs.sort() {
                (item1, item2) in
                return sortDescriptor.compareObject(item1, toObject: item2)
                    == NSComparisonResult.OrderedAscending
            }
        }
        
        tableView.reloadData()
    }
    // END osx_tableview_sorting
    
    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(aNotification: NSNotification?) {
        // Insert code here to tear down your application
    }


}

