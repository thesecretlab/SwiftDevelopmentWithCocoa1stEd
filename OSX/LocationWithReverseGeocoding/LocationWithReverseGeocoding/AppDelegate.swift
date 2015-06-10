//
//  AppDelegate.swift
//  LocationWithReverseGeocoding
//
//  Created by Timothy Rodney Nugent on 8/08/2014.
//  Copyright (c) 2014 Timothy Rodney Nugent. All rights reserved.
//

import Cocoa
import CoreLocation

class AppDelegate: NSObject, NSApplicationDelegate,CLLocationManagerDelegate {
                            
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var longitudeLabel: NSTextField!
    @IBOutlet weak var latitudeLabel: NSTextField!
    @IBOutlet weak var accuracyLabel: NSTextField!
    @IBOutlet weak var spinner: NSProgressIndicator!
    
    var locationManager = CLLocationManager()

// ------
// CLGeocoder Setup
// BEGIN geocoder_setup
    @IBOutlet weak var addressLabel: NSTextField!
    var geocoder = CLGeocoder()
// END geocoder_setup
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
        self.spinner.startAnimation(nil)
        
// ------
// Region monitoring setup
// BEGIN region_setup
        let location = CLLocationCoordinate2DMake(-42.883317, 147.328277)
        let region = CLCircularRegion(  center: location,
                                        radius: 1000,
                                    identifier: "Hobart")
        locationManager.startMonitoringForRegion(region)
// END region_setup
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
// ------
// CLLocationManagerDelegate methods
// BEGIN geocoder_funcs
    func locationManager(manager: CLLocationManager!,
        didUpdateLocations locations: [AnyObject]!)
    {
        // collecting the most recent location from the array of locations
        if let newLocation = locations.last as? CLLocation
        {
            self.longitudeLabel.stringValue = String(format: "%.2f",
                newLocation.coordinate.longitude)
            self.latitudeLabel.stringValue = String(format: "%.2f",
                newLocation.coordinate.latitude)
            self.accuracyLabel.stringValue = String(format: "%.1fm",
                newLocation.horizontalAccuracy)
            self.spinner.stopAnimation(nil);
            
            self.geocoder.reverseGeocodeLocation(newLocation)
            {
                (placemarks, error) in
                if error == nil
                {
                    let placemark = placemarks[0] as! CLPlacemark
                    let address = NSString(format: "%@ %@, %@, %@ %@",
                        placemark.subThoroughfare,
                        placemark.thoroughfare,
                        placemark.locality,
                        placemark.administrativeArea,
                        placemark.country)
                    
                    self.addressLabel.stringValue = address as String
                }
                else
                {
                    // failed to reverse geocode the address
                    self.addressLabel.stringValue = "Failed to find an address"
                }
            }
        }
        else
        {
            NSLog("No location found")
        }
    }
// END geocoder_funcs
    
    func locationManager(manager: CLLocationManager!,
        didFailWithError error: NSError!)
    {
        // locationManager failed to find a location
        self.longitudeLabel.stringValue = "-"
        self.latitudeLabel.stringValue = "-"
        self.accuracyLabel.stringValue = "-"
        self.spinner.startAnimation(nil)
    }
    
// ------
// Region monitoring delegate callbacks
// BEGIN region_delegates
    func locationManager(manager: CLLocationManager!, didEnterRegion
        region: CLRegion!) {
        // have entered the region
        NSLog("Entered %@", region.identifier)
    }
    func locationManager(manager: CLLocationManager!, didExitRegion
        region: CLRegion!) {
        // have exited the region
        NSLog("Exited %@", region.identifier)
    }
// END region_delegates
}

