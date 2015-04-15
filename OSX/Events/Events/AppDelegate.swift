//
//  AppDelegate.swift
//  Events
//
//  Created by Jon Manning on 23/06/2014.
//  Copyright (c) 2014 Secret Lab. All rights reserved.
//

import Cocoa
import EventKit

class AppDelegate: NSObject, NSApplicationDelegate {
                            
    @IBOutlet var window: NSWindow!
    
    // BEGIN property_date
    var date : NSDate = NSDate() {
        willSet {
            // Convert the provided date to one at midnight on the same day
            var dateComponents = 
    NSCalendar.currentCalendar().components(NSCalendarUnit.DayCalendarUnit |
    NSCalendarUnit.MonthCalendarUnit |
    NSCalendarUnit.YearCalendarUnit, fromDate: newValue)
            
            if let dateResult = 
            NSCalendar.currentCalendar().dateFromComponents(dateComponents) {
                self.date = dateResult
            }
            
        }
    }
    // END property_date
    
    // BEGIN property_calendars
    var calendars : [EKCalendar] {
    get {
        return self.store.calendarsForEntityType(EKEntityTypeEvent) 
        as! [EKCalendar];
    }
    }
    // END property_calendars
    
    // BEGIN property_events
    var events : [EKEvent] {
    get {
        var endDate = date.dateByAddingTimeInterval(24 * 60 * 60)
        
        var predicate = 
        self.store.predicateForEventsWithStartDate(self.date, 
        endDate: endDate, calendars: self.calendars)
        
        return self.store.eventsMatchingPredicate(predicate) as! [EKEvent]
    }
    }
    // END property_events
    
    // BEGIN property_eventstore
    lazy var store : EKEventStore = EKEventStore()
    
    func applicationDidFinishLaunching(notification: NSNotification)  {
        self.store.requestAccessToEntityType(EKEntityTypeEvent) {
            (success: Bool, error: NSError!) in
            println("Got permission = \(success); error = \(error)")
        }
    }
    // END property_eventstore
    
    // BEGIN updating_events_when_date_changes
    class func keyPathsForValuesAffectingEvents() -> NSSet! {
        return NSSet(object: "date")
    }
    // END updating_events_when_date_changes

}

